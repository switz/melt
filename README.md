#Tweezer

[![build status](https://secure.travis-ci.org/switz/tweezer.png)](http://travis-ci.org/switz/tweezer)

## How to send a tweet + status update

    var Tweezer = require('tweezer');

    var networks = {
      twitter: {
        consumer_key: 'your',
        consumer_secret: 'keys',
        access_token_key: 'go',
        access_token_secret: 'here'
      },
      facebook: {
        access_token: 'access token'
      }
    }

    var tweezer = new Tweezer(networks);

    var message = "Won't you step in to the freezer";

    tweezer.tweet(message, function(err, data) {
      console.log(data);
    });

    tweezer.updateStatus(message, function(err, data) {
      console.log(data);
    });
