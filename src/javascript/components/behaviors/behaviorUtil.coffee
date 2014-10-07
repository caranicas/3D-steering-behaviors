THREE = require 'THREE'

class Util

	constructor: ->
		@

	seek:(target,current) ->
		new THREE.Vector3().subVectors(target,current)

	seekSteer:(target,curpos, curvel, maxForce, maxSpeed) ->
		seek = @seek(target,curpos).normalize()
		seek.multiplyScalar(maxSpeed)
		steer = @limit(@seek(seek,curvel),maxForce)
		steer

	limit:(vec3, max) ->
		if vec3.length() > max
			vec3.normalize()
			vec3.multiplyScalar(max)
		vec3

	facing: ->

module.exports = new Util