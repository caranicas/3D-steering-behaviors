###*
# The Main enterance Into my App
#
# @classView
# @constructor
#
###
_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'

Flocking = require './FlockingDemo.coffee'

module.exports = Backbone.View.extend
  template: require './template.hbs'

  initialize: ->
    @render()

  render: ->
    @$el.html @template
    Flocking.threeInit()
    Flocking.loop()