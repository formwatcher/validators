
# Dependencies
utils = require "./utils"


# Gets the Validator class as argument to facilitate testing
module.exports = (Validator) ->

  # ## Float validator
  #
  # This one is a bit tricky because it allows for different decimal marks.
  #
  # It autodetects the decimal mark, and parses the number accordingly.
  #
  # Eg.:
  #
  # `"123.456,789"` and  
  # `"123,456.789"` both become the number `123456.789`.
  #
  # The actual value that will be used is the number, with the `decimalMark` option. So if you pass `','` as decimal mark
  # the formatted value will be: `"123456,789"`
  class extends Validator

    name: "Float"

    description: "Makes sure a value is a float"

    classNames: [ "validate-float" ]

    defaultOptions:
      decimalMark: ","

    validate: (value) ->
      value = @sanitize value
      regex = new RegExp("\\d+(\\" + @options.decimalMark + "\\d+)?")
      return "Must be a number."  unless value.replace(regex, "") is ""
      true

    sanitize: (value) ->
      if value.indexOf(".") >= 0 and value.indexOf(",") >= 0
        if value.lastIndexOf(",") > value.lastIndexOf(".")
          # `,` seems to be the decimal mark.
          value = value.replace(/\./g, "")
        else
          value = value.replace(/\,/g, "")

      value = value.replace(/\,/g, ".")  if value.indexOf(",") >= 0

      # Apparently there is no decimal mark. Only thousands separators.
      value = value.replace(/\./g, "")  unless value.indexOf(".") is value.lastIndexOf(".")

      # Now make sure the right decimal mark is used:
      value = value.replace(/\./g, @options.decimalMark)

      utils.trim value


