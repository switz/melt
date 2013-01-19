VERSION = '0.0.1'

http = require 'http'
querystring = require 'querystring'

twitter = require 'ntwitter'

validate = require './validate'

class Tweezer
  constructor: (@networks) ->
    @twitter = networks.twitter || {}
    @facebook = networks.facebook || {}

    if validate.twitter @twitter
      @twit = new twitter @twitter

  tweet: (message, callback) =>
    unless validate.twitter @twitter
      return callback 'Need four parameters'

    if message.length > 140
      return callback 'Message should be < 140'

    @twit
      .verifyCredentials (err, data) ->
        console.log 'verify', err, data
      .updateStatus message, (err, data) ->
        return callback err if err

        console.log "Tweeted #{message}"
        callback null, data

module.exports = Tweezer
