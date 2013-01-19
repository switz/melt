test = require 'tape'
config = require './config'
Tweezer = require '../index'

facebook = config.facebook

networks =
  facebook: facebook

tweezer = new Tweezer networks
message = "Won't #{Math.random()} step #{Math.random()} to #{Math.random()} freezer #{Math.random()}"

testUserUrl = facebook.app_id + '/accounts/test-users'
params =
  installed: true
  name: 'Reba'
  permission: facebook.scope
  method: 'post'
  access_token: facebook.access_token

test 'get user', (t) ->
  t.plan 2

  tweezer.get testUserUrl, params, (err, user) ->
    t.ok user.access_token
    t.ok user.email


    test 'update status', (t) ->
      t.plan 2

      tweezer.updateStatus user.access_token, message, (err, data) ->
        console.log data
        t.equal data.text, message
        t.equal data.user.screen_name, 'reba_hi'

