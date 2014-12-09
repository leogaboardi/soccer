  Rails.application.routes.draw do

  devise_for :users
  root 'soccer#index'
  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the "front end" (what any user can see)
  ##### ##### ##### ##### ##### ##### ##### #####

  # READ MATCH WITHOUT BET
  get("/current/done", { :controller => "soccer", :action => "no_bet_left" })
  get("/current/:id", { :controller => "soccer", :action => "match_bet" })
  get("/create_current_bet", { :controller => "soccer", :action => "create_bet" })

  # READ MATCH WITH BET
  get("/current", { :controller => "soccer", :action => "current_index" })
  get("/current/bet/:match_id", { :controller => "soccer", :action => "match_show" })

  # READ MATCH WITH RESULT
  get("/past", { :controller => "soccer", :action => "past_index" })
  get("/past/:match_id", { :controller => "soccer", :action => "match_show" })

  # Routes for static pages
  get("/faq", { :controller => "public",  :action => "faq" })
  get("/about", {:controller => "public",  :action =>  "about"})
  get("/howitworks", {:controller => "public",  :action =>  "howitworks"})

  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the admin only
  ##### ##### ##### ##### ##### ##### ##### #####

  get("/todo", {:controller => "soccer",  :action =>  "todo"})

  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the Team resource:
  ##### ##### ##### ##### ##### ##### ##### #####

  # CREATE
  get('/teams/new_form', { :controller => 'team', :action => 'new_form' })
  get('/create_team', { :controller => 'team', :action => 'create_row' })

  # READ
  get('/teams', { :controller => 'team', :action => 'index' })
  get('/teams/:id', { :controller => 'team', :action => 'show' })

  # UPDATE
  get('/teams/:id/edit_form', { :controller => 'team', :action => 'edit_form' })
  get('/update_teams/:id', { :controller => 'team', :action => 'update_row' })

  # DELETE
  get('/teams/:id/delete', { :controller => 'team', :action => 'destroy' })

  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the User resource:
  ##### ##### ##### ##### ##### ##### ##### #####

  # CREATE
  get('/users/new_form', { :controller => 'user', :action => 'new_form' })
  get('/create_user', { :controller => 'user', :action => 'create_row' })

  # READ
  get('/users', { :controller => 'user', :action => 'index' })
  get('/users/:id', { :controller => 'user', :action => 'show' })

  # UPDATE
  get('/users/:id/edit_form', { :controller => 'user', :action => 'edit_form' })
  get('/update_users/:id', { :controller => 'user', :action => 'update_row' })

  # DELETE
  get('/users/:id/delete', { :controller => 'user', :action => 'destroy' })

  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the Match resource:
  ##### ##### ##### ##### ##### ##### ##### #####

  # CREATE
  get('/matches/new_form', { :controller => 'match', :action => 'new_form' })
  get('/create_match', { :controller => 'match', :action => 'create_row' })

  # READ
  get('/matches', { :controller => 'match', :action => 'index' })
  get('/matches/:id', { :controller => 'match', :action => 'show' })

  # UPDATE
  get('/matches/:id/edit_form', { :controller => 'match', :action => 'edit_form' })
  get('/update_matches/:id', { :controller => 'match', :action => 'update_row' })

  # DELETE
  get('/matches/:id/delete', { :controller => 'match', :action => 'destroy' })

  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the bet resource:
  ##### ##### ##### ##### ##### ##### ##### #####

  # CREATE
  get('/bets/new_form', { :controller => 'bet', :action => 'new_form' })
  get('/create_bet', { :controller => 'bet', :action => 'create_row' })

  # READ
  get('/bets', { :controller => 'bet', :action => 'index' })
  get('/bets/:id', { :controller => 'bet', :action => 'show' })

  # UPDATE
  get('/bets/:id/edit_form', { :controller => 'bet', :action => 'edit_form' })
  get('/update_bet/:id', { :controller => 'bet', :action => 'update_row' })

  # DELETE
  get('/bets/:id/delete', { :controller => 'bet', :action => 'destroy' })

  ##### ##### ##### ##### ##### ##### ##### #####
  ##### Routes for the Venue resource:
  ##### ##### ##### ##### ##### ##### ##### #####

  # CREATE
  get('/venues/new_form', { :controller => 'venue', :action => 'new_form' })
  get('/create_venue', { :controller => 'venue', :action => 'create_row' })

  # READ
  get('/venues', { :controller => 'venue', :action => 'index' })
  get('/venues/:id', { :controller => 'venue', :action => 'show' })

  # UPDATE
  get('/venues/:id/edit_form', { :controller => 'venue', :action => 'edit_form' })
  get('/update_venues/:id', { :controller => 'venue', :action => 'update_row' })

  # DELETE
  get('/venues/:id/delete', { :controller => 'venue', :action => 'destroy' })
end
