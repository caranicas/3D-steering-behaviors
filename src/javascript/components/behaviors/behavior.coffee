class Behavior

	boid:null
	init:(boid) ->
		@boid = boid
		console.log 'init behavior'

	update: ->

module.exports = Behavior