
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
      return "Must be a number." if isNaN @sanitize value
      true

    sanitize: (value) -> parseInt value, 10

