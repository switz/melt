test = require 'tape'
config = require './config'
Tweezer = require '../index'

networks =
  twitter: config.twitter

test 'send tweet', (t) ->
  t.plan 1

  tweezer = new Tweezer networks

  tweezer.tweet "Won't you step in to the freezer", (err, data) ->
    console.log err, data
    t.ok !err