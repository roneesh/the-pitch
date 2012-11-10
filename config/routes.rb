ThePitch::Application.routes.draw do


get '/pitches/new' => 'Pitch#new', :as => 'new_pitch'
post '/pitches' => 'Pitch#create'

get '/pitches' => 'Pitch#index', :as => 'pitches'

delete '/pitches/:id' => 'Pitch#destroy'

put '/pitches/:id' => 'Pitch#update'
get '/pitches/:id' => 'Pitch#show', :as => 'pitch'

get '/pitches/:id/edit' => 'Pitch#edit', :as => 'edit_pitch'

  
get '/employers' => 'employers#index', :as => 'employers'
get '/employers/new' => 'employers#new', :as => 'new_employer'
post '/employers' => 'employers#create'
get '/employers/:id' => 'employers#show', :as => 'employer'
get '/employers/:id/edit' => 'employers#edit', :as => 'edit'
put '/employers/:id' => 'employers#update', :as => 'update'
delete '/employers/:id' => 'employers#destroy', :as => 'delete'


end


























