 # ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

Binding.pry #

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "Ehq9mVtjEXZ57vwq8TOTtxOeQ"
  config.consumer_secret     = "x1kapuaFqqJBhvTtcDddOngDkxNokp0iRN7Z2KLI4r9f30NCc8"
  config.access_token        = "841667595359121409-Vz3Xy43gS4Xut9l3C67wHNW2Rs65HPa"
  config.access_token_secret = "aohuZJlemtb75ijZ0hDSjJFRrhqdZI6cJrUtRJb9FHlNZ"
end

# ligne qui permet de tweeter
topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end