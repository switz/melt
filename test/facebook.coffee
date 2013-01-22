#!/usr/bin/env coffee
test = require 'tape'
Tweezer = require '../index'

validate = require '../lib/validate'

networks =
  facebook:
    access_token: process.env.access_token1 + process.env.access_token2

unless validate.facebook networks.facebook
  networks = require './config.json'

tweezer = new Tweezer networks
message = "Won't #{Math.random()} step #{Math.random()} to #{Math.random()} freezer #{Math.random()}"

empty = {}

test 'validate keys', (t) ->
  t.plan 2

  t.ok !validate.facebook empty
  t.ok validate.facebook networks.facebook

test 'update status', (t) ->
  t.plan 2

  tweezer.updateStatus message, (err, data) ->
    t.ok !err
    t.ok data.id
