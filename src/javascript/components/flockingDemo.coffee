THREE = require 'THREE'
$ = require 'jquery'
Boid = require './objs/boid.coffee'
#Physi = require 'Physi'

class FlockingDemo

  threeInit: ->
    @__initScene()
    @__initCamera()
    @__initGeometry()

  __initScene: ->
    console.log '__initScene'
    console.log 'THREE',THREE
    @scene = new THREE.Scene()
    webcan = $('#webgl-canvas')[0];
    @renderer = new THREE.WebGLRenderer({canvas:webcan})
    @renderer.setSize( window.innerWidth, window.innerHeight )

  __initCamera: ->
    @camera = new THREE.PerspectiveCamera( 90, window.innerWidth / window.innerHeight, 1, 10000 )
    @camera.position.z = 10

  __initGeometry: ->
    @geometry = new THREE.BoxGeometry( 1, 1, 1 )
    @material = new THREE.MeshBasicMaterial( { color: 0xff00ff, wireframe: true} )
    @mesh = new THREE.Mesh( @geometry, @material )
    @scene.add(@mesh)
    @createSkyBox()

  loop:->
    requestAnimationFrame =>
      @loop()
    @update()
    @renderer.render( @scene, @camera )

  update: ->
    @mesh.rotation.x += 0.01
    @mesh.rotation.y += 0.02

  createSkyBox: ->
    imagePrefix = "images/";
    directions  = ["xpos", "xneg", "ypos", "yneg", "zpos", "zneg"]
    imageSuffix = ".png"
    skyGeometry = new THREE.CubeGeometry( 5000, 5000, 5000 )
    materialArray = []
    i = 0
    while i < 6
      newMat = new THREE.MeshBasicMaterial({ map: THREE.ImageUtils.loadTexture( imagePrefix + directions[i] + imageSuffix ),side:THREE.BackSide})
      materialArray.push(newMat)
      i++
    skyMaterial = new THREE.MeshFaceMaterial( materialArray )
    skyBox = new THREE.Mesh( skyGeometry, skyMaterial )
    @scene.add( skyBox )


  createLights: ->


  createBoids: ->
    boid = new Boid()
    boid.init();


module.exports = new FlockingDemo