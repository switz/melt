#Tweezer


## How to send a tweet
    Tweezer = require 'tweezer'

    networks =
      twitter:
        consumer_key: 'your'
        consumer_secret: 'keys'
        access_token_key: 'go'
        access_token_secret: 'here'

    tweezer = new Tweezer networks

    message = "Won't you step in to the freezer"

    tweezer.tweet message, (err, data) ->
      console.log data
