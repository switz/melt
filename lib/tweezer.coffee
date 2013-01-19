VERSION = '0.0.1'

http = require 'http'
querystring = require 'querystring'

twitter = require 'ntwitter'
facebook = require 'fbgraph'

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
      #.verifyCredentials (err, data) ->
      .updateStatus message, (err, data) ->
        return callback err if err

        console.log "Tweeted #{message}"
        callback null, data

  updateStatus: (token, message, callback) ->
    facebook.setAccessToken token
    facebook.post "saeWhat/feed", {message}, (err, res) ->
      # returns the post id
      console.log err, res

  get: (url, params, callback) ->
    facebook.get url, params, callback

module.exports = Tweezer
