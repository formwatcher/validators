
# Dependencies
utils = require "./utils"


# Gets the Validator class as argument to facilitate testing
module.exports = (Validator) ->

  # ## Email validator
  #
  # Uses the best regular expression I could find to validate email addresses
  class extends Validator

    name: "Email"

    description: "Makes sure the value is an email."

    classNames: [ "validate-email" ]

    validate: (value) ->
      value = @sanitize value

      emailRegEx = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

      unless value.match(emailRegEx) then return "Must be a valid email address." 
      true

    sanitize: (value) ->
      utils.trim value
