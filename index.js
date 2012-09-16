
var Formwatcher = require("formwatcher"),
    Validator = Formwatcher.Validator;


// Now providing Formwatcher with all validators.

Formwatcher.validators.push(require("./lib/integer")(Validator));
Formwatcher.validators.push(require("./lib/float")(Validator));
Formwatcher.validators.push(require("./lib/required")(Validator));
Formwatcher.validators.push(require("./lib/not-zero-integer")(Validator));
Formwatcher.validators.push(require("./lib/email")(Validator));
