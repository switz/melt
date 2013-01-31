#Melt

[![build status](https://secure.travis-ci.org/switz/melt.png)](http://travis-ci.org/switz/melt)

## How to send a tweet + status update

    var Melt = require('melt');

    var networks = {
      twitter: {
        consumer_key: 'your',
        consumer_secret: 'keys',
        access_token_key: 'go',
        access_token_secret: 'here'
      },
      facebook: {
        token: 'access token'
      }
    }

    var melt = new Melt(networks);

    var message = "Split open and step into the freezer.";

    melt.tweet(message, function(err, data) {
      console.log(data);
    });

    melt.updateStatus(message, function(err, data) {
      console.log(data);
    });
