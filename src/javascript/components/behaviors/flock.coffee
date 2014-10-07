Behavior = require './behavior.coffee'
THREE = require 'THREE'
Util = require './behaviorUtil.coffee'


class BehaviorFlock extends Behavior

	constructor:(boid) ->
		super boid

	update:(objs) ->
		separation = this.calcSeparate objs
		alignment = this.calcAlignment objs
		cohesion = this.calcCohesion objs
		#separation.multiplyScalar @boid.sepWeight
		#alignment.multiplyScalar @boid.aligWeight
		#cohesion.multiplyScalar @boid.cohWeight

		@boid.getAcceleration().add(separation)
		@boid.getAcceleration().add(alignment)
		@boid.getAcceleration().add(cohesion)


	calcAlignment:(objs)->
		total = new THREE.Vector3(0,0,0)
		count = 0

		for obj in objs
			if obj isnt @boid
				distLine = new THREE.Line3(@boid.getPosition(),obj.getPosition())
				distance = distLine.distance()
				if distance > 0 && distance < @boid.aligRad
					total.add(obj.getVelocity())
					count++

		if count > 0
			total.divideScalar(count)
			total.normalize()
			total.multiplyScalar(@boid.maxSpeed)
			steer = new THREE.Vector3(0,0,0)
			steer.subVectors(total,@boid.getVelocity())
			steer = Util.limit(steer,@boid.maxForce)
			return steer

		else
			return new THREE.Vector3(0,0,0)

	calcCohesion:(objs) ->
		total = new THREE.Vector3(0,0,0)
		count = 0
		for obj in objs
			if obj isnt @boid
				distLine = new THREE.Line3(@boid.getPosition(), obj.getPosition())
				distance = distLine.distance()
				if distance > 0 and distance < @boid.cohRad
					total.add(obj.getPosition())
					count++;

		if count > 0
			total.divideScalar(count)
			return Util.seekSteer(total, @boid.getPosition(), @boid.getVelocity(), @boid.maxForce, @boid.maxSpeed)

		else
			return  new THREE.Vector3(0,0,0)


	calcSeparate:(objs) ->
		steer = new THREE.Vector3(0,0,0)
		vector = new THREE.Vector3(0,0,0)
		count = 0

		for obj in objs
			if obj isnt @boid
				distLine = new THREE.Line3(@boid.getPosition(), obj.getPosition())
				distance = distLine.distance()
				if distance > 0 and distance < @boid.sepRad
					diff = new THREE.Vector3(0,0,0).subVectors(@boid.getPosition(), obj.getPosition());
					diff.normalize();
					diff = diff.divideScalar(distance);
					steer.add(diff)
					count++;

		if (count > 0)
			steer.divideScalar(count)

		if(steer.length() > 0)
			steer.normalize();
			steer.multiplyScalar(@boid.maxSpeed)
			steer = steer.sub(@boid.getVelocity())
			steer = Util.limit(steer, @boid.maxForce)

		return steer;



module.exports = BehaviorFlock