
describe "validator", ->
  class Validator

  describe "integer", ->
    validator = new (require("../src/integer")(Validator))

    it "should have correct classNames", ->
      validator.classNames.should.eql [ "validate-integer" ]

    it "should sanitize properly", ->
      validator.sanitize("  12ab   ").should.equal "12ab"

    it "should validate properly", ->
      err = "Has to be a number."
      validator.validate("12ab").should.eql err
      validator.validate("12.12").should.eql err
      validator.validate("").should.equal true
      validator.validate("12").should.equal true
