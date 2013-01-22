#!/usr/bin/env coffee
test = require 'tape'
networks = require './config.json'
Tweezer = require '../index'

validate = require '../lib/validate'

tweezer = new Tweezer networks
message = "Won't #{Math.random()} step #{Math.random()} to #{Math.random()} freezer #{Math.random()}"

empty = {}

test 'validate keys', (t) ->
  t.plan 2

  t.ok !validate.twitter empty
  t.ok validate.twitter networks.twitter

test 'send tweet', (t) ->
  t.plan 2

  tweezer.tweet message, (err, data) ->
    t.equal data.text, message
    t.equal data.user.screen_name, 'reba_hi'
