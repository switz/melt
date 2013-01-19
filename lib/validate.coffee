validate = {}

validate.twitter = (object) ->
  return true if object.consumer_key &&
    object.consumer_secret &&
    object.access_token_key &&
    object.access_token_secret
  false

module.exports = validate
