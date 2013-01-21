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

    if validate.facebook @facebook
      @fb = facebook
      # TODO: This only works with one facebook account for now
      # I'll have to extend one of the fb API modules for it to work on
      # multiple accounts
      @fb.setAccessToken @facebook.access_token

  tweet: (message, callback) =>
    unless validate.twitter @twitter
      return callback 'Twitter: Need four parameters'

    if message.length > 140
      return callback 'Twitter: Message should be < 140'

    @twit
      #.verifyCredentials (err, data) ->
      .updateStatus message, (err, data) ->
        return callback err if err

        console.log "Tweeted #{message}"
        callback null, data

  updateStatus: (message, callback) ->
    unless validate.facebook @facebook
      return callback 'Facebook: Need access_token'

    @fb.post "saeWhat/feed", {message}, (err, res) ->
      # returns the post id
      console.log err, res

  get: (url, params, callback) ->
    facebook.get url, params, callback

module.exports = Tweezer
