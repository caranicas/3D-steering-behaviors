Behavior = require 'behavior.js'

class BehaviorFlock extends Behavior

	init: ->
		super
		console.log 'init behavior flock'

	update: ->
		separation = this.calcSeparate(objs);
		alignment = this.calcAlignment(objs);
		cohesion = this.calcCohesion(objs);

	calcAlignment:(objs)->

	calcCohesion:(objs) ->

	calcSeparate:(objs) ->


module.exports = new BehaviorFlock