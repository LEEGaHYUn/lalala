Rails.application.routes.draw do
 
  
 devise_for :users
 mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 get '/errorview/error_page'
 
 root 'posts#show'
 
 # posts
 get '/posts/new' => 'posts#new'
 post '/posts/create' => 'posts#create'
 get '/posts/show' => 'posts#show'
 get '/posts/detail/:post_id' => 'posts#detail'
 get '/posts/destroy/:post_id' => 'posts#destroy'
 get '/posts/edit/:post_id' => 'posts#edit'
 post '/posts/update/:post_id' => 'posts#update'
 
 # comments
 post '/posts/detail/:post_id/comments/create' => 'comments#create'
 post '/posts/detail/:post_id/comments/destroy/:comment_id' => 'comments#destroy'
 
 # likes
 post '/:post_id/like_create' => 'likes#like_create'
end
