coffee = require 'coffee-script'
stylus = require 'stylus'
sass = require 'node-sass'

class SASSWrapper
    constructor: (@content, @file) ->
      @options = {}
    render: (cb) =>
      sass = require 'node-sass'
      try
        return cb null, sass.renderSync(@content,
          {includePaths: [path.dirname(@file)]})
      catch err
        return cb err, null

module.exports =
  stylus: (content, file) ->
    return stylus(content)
    .set('filename', file)
  sass: (content, file) ->
  	return new SASSWrapper(content, file)
  coffee: (content, file) ->
    return coffee.compile(content)
  js: (content) ->
    return content
  css: (content) ->
    return content
