THREE = require 'three'
$ = require 'jquery'

class FlockingDemo

	threeInit: ->
    @camera = new THREE.PerspectiveCamera( 100, window.innerWidth / window.innerHeight, 1, 10000 )
    @camera.position.z = 1000
    @scene = new THREE.Scene()
    @geometry = new THREE.BoxGeometry( 200, 200, 200 )
    @material = new THREE.MeshBasicMaterial( { color: 0xff00ff, wireframe: true} )
    @mesh = new THREE.Mesh( @geometry, @material )
    @scene.add(@mesh)
    webcan = $('#webgl-canvas')[0];
    @renderer = new THREE.WebGLRenderer({canvas:webcan})
    @renderer.setSize( window.innerWidth, window.innerHeight )

  loop:->
    requestAnimationFrame =>
      @loop()
    @update()
    @renderer.render( @scene, @camera )

  update: ->
    @mesh.rotation.x += 0.01
    @mesh.rotation.y += 0.02

module.exports = new FlockingDemo