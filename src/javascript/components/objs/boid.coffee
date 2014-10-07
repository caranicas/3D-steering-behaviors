
Entity = require './entity.coffee'

class Boid extends Entity

	constructor: ->
		super
		@

	init:(defaults) ->
		console.log 'entity defaults', defaults
		super defaults
		@


module.exports = Boid

