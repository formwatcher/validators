

# Gets the Validator class as argument to facilitate testing
module.exports = (Validator) ->

  # ## NotZero validator
  #
  # The value can be any number except 0
  class extends Validator

    name: "NotZeroInteger"

    description: "Makes sure the value is not 0."

    classNames: [ "validate-not-zero-integer" ]

    validate: (value) ->
      value = @sanitize value
      return "Must be a number." if isNaN value 
      return "Can not be 0." if value is 0
      true

    sanitize: (value) -> parseInt value, 10
