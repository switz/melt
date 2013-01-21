validate = {}

validate.twitter = (twitter) ->
  return true if twitter.consumer_key &&
    twitter.consumer_secret &&
    twitter.access_token_key &&
    twitter.access_token_secret
  false

validate.facebook = (facebook) ->
  return true if facebook.access_token
  false

module.exports = validate
