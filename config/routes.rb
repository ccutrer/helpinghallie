HelpingHallie::Application.routes.draw do
  resources :events, :type => 'Event'
  resources :news, :controller => 'events', :type => 'News'
  resources :updates, :controller => 'events', :type => 'Update'

  get 'contact(.:format)', to: 'application#contact'
  get 'donations(.:format)', to: 'application#donations'
  get 'story(.:format)', to: 'application#story'
  get 'tshirts(.:format)', to: 'application#tshirts'
  get 'rss.xml', to: 'events#index', :format => 'rss', :type => 'Update'

  get '/auth/:provider/callback', :to => 'sessions#create'

  root :to => 'application#index'
end
