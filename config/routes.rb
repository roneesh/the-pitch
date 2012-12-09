ThePitch::Application.routes.draw do

  get "pitch_attachment/new", :as => "new_pitch_attachment"
  post "pitch_attachment/create"

  delete '/pitch_attachment/:id' => 'PitchAttachment#destroy', :as => "pitch_attachment_destroy"

  get '/pitch_attachment/:id/edit' => 'PitchAttachment#edit', :as => "pitch_attachment_edit"

  put '/pitch_attachment/:id' => 'PitchAttachment#update', :as => "pitch_attachment_update"
 
  get "attachment/new"

  get "attachment/create"

  delete "attachment/delete"


root :to => 'Sessions#landingpage'

get '/aboutus' => 'sessions#about_us', :as => 'about_us'

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
get '/pitches/:id' => 'Pitch#show', :as => 'pitch'
delete '/pitches/:id' => 'Pitch#destroy'
put '/pitches/:id' => 'Pitch#update'
get '/pitches/:id/edit' => 'Pitch#edit', :as => 'edit_pitch'
post '/shorten/:id' => 'Pitch#shorten', :as => 'shorten'
get '/email/:id' => 'Pitch#email', :as => 'email'
get '/*userid/*pitchid/a-pitch-from/*userfirstname' => 'Pitch#short_url'
get '/a_pitch/*short_descriptive_url' => 'Pitch#short_url'

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

get "prompt/new" => 'prompt#new', :as => 'new_prompt'
post "prompt/create" => 'prompt#create'
delete "prompt/:id" => 'prompt#delete', :as => 'prompt'

get "/mockup/home" => 'mockup#home'


end

























