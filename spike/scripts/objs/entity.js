Entity = function (mesh) {

	this.mesh = mesh;
	this.acceleration = {x:0,y:0,z:0};
	this.velocity = {x:0,y:0,z:0};

};

Entity.prototype.initalize = function(index, asset){
	return this;
}

Entity.prototype.create = function(pos,vel,angle, debug){

		return this;
}

Entity.prototype.update = function(){

	this.updateVelocity();
	this.updatePosition();

}

Entity.prototype.updateVelocity = function(){

}

Entity.prototype.updatePosition = function(){

}





Entity.prototype.debugRender = function(){

}

Entity.prototype.getPosition = function(index, asset) {
	return this.mesh.getPosition();
}

// Facade for sprite
Entity.prototype.getVelocity =function( ){
	return this.sprite.body.velocity;
}
