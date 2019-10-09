Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/adminhome'
  get 'pages/studenthome'
  get 'pages/librarianhome'
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations'  }
  devise_for :librarians, controllers: { sessions: 'librarians/sessions', registrations: 'librarians/registrations' }
  devise_for :students, controllers: { sessions: 'students/sessions', registrations: 'students/registrations' }
  resources :programs
  resources :books do
    collection do
      post 'placeHoldRequest'
      post 'placeCheckoutRequest'
      post 'returnBook'	 
      post 'addToWishList'
      post 'remove_from_wish_list'
      post 'cancelHoldRequest'
    end
  end
  resources :libraries
  scope "/admin" do
  	resources :students
  end
  scope "/admin" do	
  	resources :librarians
  end	
  resources :universities
  root to: 'pages#home'	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
