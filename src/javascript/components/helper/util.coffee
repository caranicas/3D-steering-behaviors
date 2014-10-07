THREE = require 'THREE'

class Util

	constructor: ->

	getBoidGeometry: ->
		geometry = new THREE.Geometry();
		geometry.vertices.push(
			new THREE.Vector3( -10,  10, 0 ),
			new THREE.Vector3( -10, -10, 0 ),
			new THREE.Vector3(  10, -10, 0 )
		)
		geometry.computeBoundingSphere();
		return geometry;



module.exports = new Util