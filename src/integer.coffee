
# Dependencies
utils = require "./utils"


# Gets the Validator class as argument to facilitate testing
module.exports = (Validator) ->
  # ## Integer validator
  #
  # Makes sure that only digits are present
  class extends Validator
    name: "Integer"
    description: "Makes sure a value is an integer"
    classNames: [ "validate-integer" ]
    validate: (value) ->
      return "Has to be a number."  unless value.replace(/\d*/, "") is ""
      true

    sanitize: (value) ->
      utils.trim value

