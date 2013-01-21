test = require 'tape'
networks = require './config'
Tweezer = require '../index'

validate = require '../lib/validate'

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
