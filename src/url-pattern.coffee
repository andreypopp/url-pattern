common = require './common'

patternPrototype =
    match: (url) ->
        match = @regex.exec url
        return null unless match?

        captured = match.slice(1)
        return captured if @isRegex

        bound = {}
        for value, i in captured
          name = @names[i]
          if name == '_'
            bound[name] = bound[name] || []
            bound[name].push value
          else
            bound[name] = value

        bound

module.exports = (arg) ->
    isRegex = arg instanceof RegExp
    unless ('string' is typeof arg) or isRegex
        throw new TypeError 'argument must be a regex or a string'
    p = Object.create patternPrototype
    p.isRegex = isRegex
    p.regex = if isRegex then arg else new RegExp common.toRegexString arg
    p.names = common.getNames arg unless isRegex
    p
