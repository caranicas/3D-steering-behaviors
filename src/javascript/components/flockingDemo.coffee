THREE = require 'three'
$ = require 'jquery'
Boid = require './objs/boid.coffee'
Physi = require 'Physi'

class FlockingDemo

  threeInit: ->
    @__initScene()
    @__initCamera()
    @__initGeometry()
    console.log('try create')
    @createBoid()

  __initScene: ->
    @scene = new THREE.Scene()
    webcan = $('#webgl-canvas')[0];
    @renderer = new THREE.WebGLRenderer({canvas:webcan})
    @renderer.setSize( window.innerWidth, window.innerHeight )

  __initCamera: ->
    @camera = new THREE.PerspectiveCamera( 100, window.innerWidth / window.innerHeight, 1, 10000 )
    @camera.position.z = 1000

  __initGeometry: ->
    @geometry = new THREE.BoxGeometry( 200, 200, 200 )
    @material = new THREE.MeshBasicMaterial( { color: 0xff00ff, wireframe: true} )
    @mesh = new THREE.Mesh( @geometry, @material )
    @scene.add(@mesh)

  loop:->
    requestAnimationFrame =>
      @loop()
    @update()
    @renderer.render( @scene, @camera )

  update: ->
    @mesh.rotation.x += 0.01
    @mesh.rotation.y += 0.02

  createBoid: ->
    boid = new Boid()
    boid.init();

    console.log 'Physi'
    console.log Physi


module.exports = new FlockingDemo