 # ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

Binding.pry #

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "key"
  config.consumer_secret     = "key"
  config.access_token        = "key"
  config.access_token_secret = "key"
end

# ligne qui permet de tweeter
topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
