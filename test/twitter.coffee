#!/usr/bin/env coffee
test = require 'tape'
Tweezer = require '../index'

validate = require '../lib/validate'

networks =
  twitter:
    consumer_key: process.env.consumer_key,
    consumer_secret: process.env.consumer_secret,
    access_token_key: process.env.access_token_key,
    access_token_secret: process.env.access_token_secret

unless validate.twitter networks.twitter
  networks = require './config.json'

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
