ThePitch::Application.routes.draw do
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
get '/employers' => 'employers#index', :as => 'employers'
get '/employers/new' => 'employers#new', :as => 'new_employer'
post '/employers' => 'employers#create'
get '/employers/:id' => 'employers#show', :as => 'employer'
get '/employers/:id/edit' => 'employers#edit', :as => 'edit'
put '/employers/:id' => 'employers#update', :as => 'update'
delete '/employers/:id' => 'employers#destroy', :as => 'delete'

end


























