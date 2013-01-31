#!/usr/bin/env coffee
test = require 'tape'
Melt = require '../index'

validate = require '../lib/validate'

networks =
  facebook:
    token: process.env.access_token1 + process.env.access_token2

unless validate.facebook networks.facebook
  networks = require './config.json'

melt = new Melt networks
message = "Won't #{Math.random()} step #{Math.random()} to #{Math.random()} freezer #{Math.random()}"

empty = {}

test 'validate keys', (t) ->
  t.plan 2

  t.ok !validate.facebook empty
  t.ok validate.facebook networks.facebook

test 'update status', (t) ->
  t.plan 2

  melt.updateStatus message, (err, data) ->
    console.log data, err
    t.ok !err
    t.ok data.id
