require 'open-uri'
require 'json'

class VenueController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!
  before_action :check_if_admin

  #Checks if current_user is admin, and therefore can play around with the venue table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def index
    @venue = Venue.order("label")
  end

  def show
    @venue = Venue.find(params[:id])

    if @venue.address.present?
      url_safe_address = URI.encode(@venue.address)
      url_of_data = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}"
      raw_data = open(url_of_data).read
      parsed_data = JSON.parse(raw_data)

      @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
      @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    end
  end

  def new_form
    @venue = Venue.new
  end

  def create_row
    @venue = Venue.new
    @venue.name = params[:name]
    @venue.label = params[:label]
    @venue.picture_url = params[:picture_url]
    @venue.address = params[:address]
     @venue.capacity = params[:capacity]

    if @venue.save
      redirect_to "/venues", :notice => "Venue created successfully."
    else
      render "new_form"
    end

  end

  def edit_form
    @venue = Venue.find(params[:id])
  end

  def update_row
    @venue = Venue.find(params[:id])
    @venue.name = params[:name]
    @venue.label = params[:label]
    @venue.picture_url = params[:picture_url]
    @venue.capacity = params[:capacity]
    @venue.address = params[:address]

    if @venue.save
      redirect_to "/venues", :notice => "Venue updated successfully."
    else
      render "edit_form"
    end

  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to "/venues", :notice => "Venue deleted."
  end
end
