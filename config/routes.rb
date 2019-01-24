# frozen_string_literal: true

# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                   leagues GET    /leagues(.:format)                                                                       leagues#index
#                           POST   /leagues(.:format)                                                                       leagues#create
#                new_league GET    /leagues/new(.:format)                                                                   leagues#new
#               edit_league GET    /leagues/:id/edit(.:format)                                                              leagues#edit
#                    league GET    /leagues/:id(.:format)                                                                   leagues#show
#                           PATCH  /leagues/:id(.:format)                                                                   leagues#update
#                           PUT    /leagues/:id(.:format)                                                                   leagues#update
#                           DELETE /leagues/:id(.:format)                                                                   leagues#destroy
#     football_associations GET    /football_associations(.:format)                                                         football_associations#index
#                           POST   /football_associations(.:format)                                                         football_associations#create
#  new_football_association GET    /football_associations/new(.:format)                                                     football_associations#new
# edit_football_association GET    /football_associations/:id/edit(.:format)                                                football_associations#edit
#      football_association GET    /football_associations/:id(.:format)                                                     football_associations#show
#                           PATCH  /football_associations/:id(.:format)                                                     football_associations#update
#                           PUT    /football_associations/:id(.:format)                                                     football_associations#update
#                           DELETE /football_associations/:id(.:format)                                                     football_associations#destroy
#                     clubs GET    /clubs(.:format)                                                                         clubs#index
#                           POST   /clubs(.:format)                                                                         clubs#create
#                  new_club GET    /clubs/new(.:format)                                                                     clubs#new
#                 edit_club GET    /clubs/:id/edit(.:format)                                                                clubs#edit
#                      club GET    /clubs/:id(.:format)                                                                     clubs#show
#                           PATCH  /clubs/:id(.:format)                                                                     clubs#update
#                           PUT    /clubs/:id(.:format)                                                                     clubs#update
#                           DELETE /clubs/:id(.:format)                                                                     clubs#destroy
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                      page GET    /pages/*id                                                                               pages#show
#                      root GET    /                                                                                        pages#show {:id=>"home"}
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :leagues
  resources :football_associations
  resources :clubs
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/pages/*id' => 'pages#show', as: :page, format: false

  root to: 'pages#show', id: 'home'
end
