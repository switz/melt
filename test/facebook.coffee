test = require 'tape'
config = require './config'
Tweezer = require '../index'

networks =
  facebook: config.facebook

test 'send tweet', (t) ->
  t.plan 2

  tweezer = new Tweezer networks
  message = "Won't #{Math.random()} step #{Math.random()} to #{Math.random()} freezer #{Math.random()}"

  tweezer.tweet message, (err, data) ->
    t.equal data.text, message
    t.equal data.user.screen_name, 'reba_hi'
