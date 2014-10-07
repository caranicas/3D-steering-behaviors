Behavior = require './behavior.coffee'


class BehaviorFlock extends Behavior

	init:(boid) ->
		super boid
		console.log 'init behavior flock'

	update:(objs) ->
		separation = this.calcSeparate(objs);
		alignment = this.calcAlignment(objs);
		cohesion = this.calcCohesion(objs);

	calcAlignment:(objs)->

	calcCohesion:(objs) ->

	calcSeparate:(objs) ->


module.exports = BehaviorFlock