
module.exports =
  trim: (string) ->
    string.replace /(^\s*|\s*$)/g, ""
