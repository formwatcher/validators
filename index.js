
var Formwatcher = require("formwatcher"),
    Validator = Formwatcher.Validator;


// Now providing Formwatcher with all validators.

Formwatcher.registerValidator(require("./lib/integer")(Validator));
Formwatcher.registerValidator(require("./lib/float")(Validator));
Formwatcher.registerValidator(require("./lib/required")(Validator));
Formwatcher.registerValidator(require("./lib/not-zero-integer")(Validator));
Formwatcher.registerValidator(require("./lib/email")(Validator));
