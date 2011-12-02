Rails.application.config.middleware.use OmniAuth::Strategies::OpenID, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
