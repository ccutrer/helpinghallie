HelpingHallie::Application.routes.draw do
  resources :events, :type => 'Event', :type => 'Event'
  resources :news, :controller => 'events', :type => 'News'
  resources :updates, :controller => 'events', :type => 'Update'

  match 'contact(.:format)' => 'application#contact'
  match 'donations(.:format)' => 'application#donations'
  match 'story(.:format)' => 'application#story'
  match 'tshirts(.:format)' => 'application#tshirts'
  match 'rss.xml' => 'events#index', :format => 'rss', :type => 'Update'

  match '/auth/:provider/callback', :to => 'sessions#create'

  root :to => 'application#index'
end
