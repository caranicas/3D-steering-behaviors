
function BehaviorFlock(boid) {
	Behavior.call(this, boid); // call super constructor.
}


// subclass extends superclass
BehaviorFlock.prototype = Object.create(Behavior.prototype);
BehaviorFlock.prototype.constructor = BehaviorFlock;


BehaviorFlock.prototype = {

	update:function(objs){
		var separation = this.calcSeparate(objs);
		var alignment = this.calcAlignment(objs);
		var cohesion = this.calcCohesion(objs);

	},
	calcAlignment:function(objs){


	},
	calcCohesion:function(objs){

	},

	calcSeparate:function(objs){


		}
}
