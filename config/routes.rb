Rails.application.routes.draw do

  get("/", { :controller => "soccer", :action => "index" })


  get("/current/:current_id", { :controller => "soccer", :action => "current_matches" })
  get("/current_bets/:current_id", { :controller => "soccer", :action => "current_bets" })


  get("/results/:page", { :controller => "soccer", :action => "results_index" })

  # Routes for static pages
  get("/faq", { :controller => "soccer",  :action => "faq" })
  get("/todo", {:controller => "soccer",  :action =>  "todo"})
  get("/about", {:controller => "soccer",  :action =>  "about"})

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
  get('/update_matchs/:id', { :controller => 'match', :action => 'update_row' })

  # DELETE
  get('/matches/:id/delete', { :controller => 'match', :action => 'destroy' })
end
