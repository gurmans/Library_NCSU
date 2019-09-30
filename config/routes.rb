Rails.application.routes.draw do
  devise_for :librarians, controllers: { sessions: 'librarians/sessions', registrations: 'librarians/registrations' }
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  resources :programs
  resources :book_histories
  resources :books
  resources :libraries
  scope "/admin" do
  	resources :students
  end
  scope "/admin" do	
  	resources :librarians
  end	
  resources :universities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
