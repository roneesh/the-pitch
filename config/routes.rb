ThePitch::Application.routes.draw do

root :to => 'Sessions#landingpage'

get '/employerlogin' => 'sessions#newemployer', :as => 'employerlogin'
post '/sessions/createemployer' => 'sessions#create_employer'
get '/logout' => 'sessions#destroy', :as => 'logout'

get '/userlogin' => 'sessions#newuser', :as => 'userlogin'
post '/sessions/createuser' => 'sessions#create_user', :as => 'createuser'


get '/users', controller: 'Users', action: 'index', :as => 'users'
post '/users', controller: 'Users', action: 'create'
get '/users/new', controller: 'Users', action: 'new', :as => 'new_user'
get '/users/:id/edit', controller: 'Users', action: 'edit', :as => 'edit_user'
get '/users/:id', controller: 'Users', action: 'show', :as => 'user'

put '/users/:id', controller: 'Users', action: 'update'
delete '/users/:id', controller: 'Users', action: 'destroy'


get '/pitches/new' => 'Pitch#new', :as => 'new_pitch'
post '/pitches' => 'Pitch#create'
get '/pitches' => 'Pitch#index', :as => 'pitches'
delete '/pitches/:id' => 'Pitch#destroy'
put '/pitches/:id' => 'Pitch#update'
get '/pitches/:id' => 'Pitch#show', :as => 'pitch'
get '/pitches/:id/edit' => 'Pitch#edit', :as => 'edit_pitch'
post '/shorten/:id' => 'Pitch#shorten', :as => 'shorten'
   
get '/employers' => 'employers#index', :as => 'employers'
get '/employers/new' => 'employers#new', :as => 'new_employer'
post '/employers' => 'employers#create'
get '/employers/:id' => 'employers#show', :as => 'employer'
get '/employers/:id/edit' => 'employers#edit', :as => 'edit'
put '/employers/:id' => 'employers#update', :as => 'update'
delete '/employers/:id' => 'employers#destroy', :as => 'delete'


get '/jobs' => 'jobs#index', :as => 'jobs'
get '/jobs/new' => 'jobs#new', :as => 'new_job'
post '/jobs' => 'jobs#create'
get '/jobs/:id' => 'jobs#show', :as => 'job'
get '/jobs/:id/edit' => 'jobs#edit', :as => 'edit_job'
put '/jobs/:id' => 'jobs#update', :as => 'update_job'
delete '/jobs/:id' => 'jobs#destroy', :as => 'destroy_job'

end

























