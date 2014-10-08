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

	avoidWalls:(vector,bounds, buffer, stregth) ->
		avoidance = new THREE.Vector3(0,0,0)

		if vector.x < -bounds+buffer
			avoidance.x = stregth
		else if vector.x > bounds-buffer
			avoidance.x = -stregth;

		if vector.y < -bounds+buffer
			avoidance.y = stregth
		else if vector.y > bounds-buffer
			avoidance.y = -stregth

		if vector.z < -bounds+buffer
			avoidance.z = stregth
		else if vector.z > bounds-buffer
			avoidance.z = -stregth

		return avoidance;

	facing:(entity) ->
		pos = entity.getPosition().clone()
		vel = entity.getVelocity().clone()
		target = new THREE.Vector3().addVectors(pos, vel)
		pos.normalize()
		vel.normalize()
		dot = pos.dot(vel)
		console.log('dot', dot)
		if Math.abs(dot + 1.0) < 0.000001
			return new THREE.Quaternion().setFromAxisAngle(new THREE.Vector3(0,1,0),3.1415)

		if Math.abs(dot - 1.0) < 0.000001
			return new THREE.Quaternion(0,0,0,1)

		rotAngle = Math.acos(dot)
		rotAxis = new THREE.Vector3().crossVectors(target,pos).normalize()
		quat = new THREE.Quaternion()
		quat.setFromAxisAngle(rotAxis, rotAngle)

		return quat

module.exports = new Util