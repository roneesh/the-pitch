ThePitch::Application.routes.draw do




































get '/pitches/new' => 'Pitch#new', :as => 'new_pitch'
post '/pitches' => 'Pitch#create'

get '/pitches' => 'Pitch#index', :as => 'pitches'

delete '/pitches/:id' => 'Pitch#destroy'

put '/pitches/:id' => 'Pitch#update'
get '/pitches/:id' => 'Pitch#show', :as => 'pitch'

get '/pitches/:id/edit' => 'Pitch#edit', :as => 'edit_pitch'










































end
