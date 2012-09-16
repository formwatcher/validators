
# Dependencies
bonzo = require "bonzo"

# Gets the Validator class as argument to facilitate testing
module.exports = (Validator) ->

  # ## Required validator
  #
  # If it's a checkbox, it has to be checked. Otherwise the value can't be 0 or an empty string (whitespace is trimmed)
  class extends Validator

    name: "Required"

    description: "Makes sure the value is not blank (nothing or spaces)."

    classNames: [ "required" ]

    validate: (sanitizedValue, input) ->
      binput = bonzo input
      return "Can not be blank."  if (binput.attr("type") is "checkbox" and not binput.is(":checked")) or not sanitizedValue.replace /\s*/g, ""
      true

