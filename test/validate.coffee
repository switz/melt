test = require 'tape'
{ twitter } = require './config'

test 'validate twitter', (t) ->
  t.plan 1

  t.ok twitter.consumer_key &&
    twitter.consumer_secret &&
    twitter.access_token_key &&
    twitter.access_token_secret
