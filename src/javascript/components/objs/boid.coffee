
Entity = require './entity.coffee'



class Boid extends Entity

	sepRad:10
	aligRad:40
	cohRad:50

	sepWeight:0.3
	cohWeight:0.2
	aligWeight:0.2

	maxAvoid:3
	maxSeeAhead:100
	debugAheadCatch:null
	debugVel:null
	debugLooK:null

	constructor: ->
		super
		@

	init:(defaults) ->
		super defaults
		@


module.exports = Boid

