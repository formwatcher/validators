
sinon = require "sinon"
utils = require "../src/utils"


describe "utils", ->
  describe "trim", ->
    it "should remove whitespace before and after", ->
      utils.trim("\n\n\t   12ab \n \n \t").should.equal "12ab"

describe "validator", ->
  class Validator
    constructor: (options) ->
      if options?
        @options = options 
      else
        @options = @defaultOptions

  afterEach ->
    utils.trim.restore?()

  describe "required", ->
    # Can't include it because of the bonzo dependency.
    # validator = new (require("../src/required")(Validator))

    it "should have a correct name"
    it "should have correct classNames"
    it "should validate properly"

  describe "integer", ->
    validator = new (require("../src/integer")(Validator))

    it "should have a correct name", ->
      validator.name.should.eql "Integer"

    it "should have correct classNames", ->
      validator.classNames.should.eql [ "validate-integer" ]

    it "should sanitize properly", ->
      isNaN(validator.sanitize("abc")).should.equal yes
      validator.sanitize("  12ab   ").should.equal 12
      validator.sanitize("  12   ").should.equal 12
      validator.sanitize("  12.34   ").should.equal 12

    it "should validate properly", ->
      err = "Must be a number."
      validator.validate("ba123").should.eql err
      validator.validate("123").should.equal true
      validator.validate("123ab").should.equal true

  describe "not-zero", ->
    validator = new (require("../src/not-zero-integer")(Validator))

    it "should have a correct name", ->
      validator.name.should.eql "NotZeroInteger"

    it "should have correct classNames", ->
      validator.classNames.should.eql [ "validate-not-zero-integer" ]

    it "should validate properly", ->
      validator.validate("0").should.eql "Can not be 0."
      validator.validate("abc").should.eql "Must be a number."
      validator.validate("1212").should.equal true

  describe "email", ->
    validator = new (require("../src/email")(Validator))

    it "should have a correct name", ->
      validator.name.should.eql "Email"

    it "should have correct classNames", ->
      validator.classNames.should.eql [ "validate-email" ]

    it "should sanitize properly", ->
      sinon.stub utils, "trim", -> "TRIMMED"
      validator.sanitize("  12ab   ").should.eql "TRIMMED"

    it "should validate properly", ->
      err = "Must be a valid email address."
      validator.validate("abc").should.eql err
      for email in [ "m@tias.me", "niceandsimple@example.com", "simplewith+symbol@example.com", "less.common@example.com", "a.little.more.unusual@dept.example.com", "'@[10.10.10.10]" ]
        validator.validate(email).should.equal true


  describe "float", ->
    validator = new (require("../src/float")(Validator))

    it "should have a correct name", ->
      validator.name.should.eql "Float"

    it "should have correct classNames", ->
      validator.classNames.should.eql [ "validate-float" ]

    it "should sanitize properly", ->
      validator.sanitize("  123.04   ").should.eql "123,04"
      validator.sanitize("  123,234.04   ").should.eql "123234,04"
      validator.sanitize("  123,234.04   ").should.eql "123234,04"
      validator.sanitize("  123.234,04   ").should.eql "123234,04"
      validator.sanitize("  123234   ").should.eql "123234"

    it "should use the options.decimalMark to format", ->
      validator2 = new (require("../src/float")(Validator))({ decimalMark: "/" })
      validator2.sanitize("  123.234,04   ").should.eql "123234/04"


    it "should validate properly", ->
      err = "Must be a number."
      validator.validate("abc").should.eql err
      for number in [ "123.04", "123.123.123,34", "12312334" ]
        validator.validate(number).should.equal true

