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

	facing:(entity) ->
		pos = entity.getPosition().clone()
		vel = entity.getVelocity().clone()
		target = new THREE.Vector3().addVectors(pos, vel)
		pos.normalize()
		vel.normalize()
		dot = pos.dot(vel)
		if dot is -1
			clean = new THREE.Quaternion().setFromAxisAngle(new THREE.Vector3(0,1,0),3.1415)
			return clean
		if dot is 1
			return new THREE.Quaternion(0,0,0,1)

		rotAngle = Math.acos(dot/57.295)
		rotAxis = new THREE.Vector3().crossVectors(pos, target).normalize()
		quat = new THREE.Quaternion()
		quat.setFromAxisAngle(rotAxis, rotAngle)

		if(isNaN(quat.x))
			console.log 'is nan'
			debugger;
		return quat

module.exports = new Util