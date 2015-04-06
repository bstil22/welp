require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = ENV["YELP_CONSUMER_KEY"]'vUk27oLj0COZ0Dygt2MIKQ'
  config.consumer_secret = ENV["YELP_CONSUMER_SECRET"]'q4xa7ShahaHz5zSuRke2I7sPUKM'
  config.token = ENV["YELP_TOKEN"]'LuoOC3DfYMWd-bUJA1GBoTuW_BWm1X0L'
  config.token_secret = ENV["YELP_SECRET_TOKEN"]'RlszmCCvxb8RTa15xfAvH7VhiQE'
end
