Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Settings.twitter_api_key, Settings.twitter_api_secret
end
