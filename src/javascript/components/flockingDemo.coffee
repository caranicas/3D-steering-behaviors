THREE = require 'THREE'
$ = require 'jquery'
Boid = require './objs/boid.coffee'
BehaviorFlock = require './behaviors/flock.coffee'

#Physi = require 'Physi'

class FlockingDemo

  demoEntities:[]
  size:200
  vertOff:60
  flockCount:40

  threeInit: ->
    @__initScene()
    @__initCamera()
    @__initGeometry()
    @__initLights()

  __initScene: ->
    @scene = new THREE.Scene()
    webcan = $('#webgl-canvas')[0]
    @renderer = new THREE.WebGLRenderer({canvas:webcan})
    @renderer.setSize( window.innerWidth, window.innerHeight )

  __initCamera: ->
    @camera = new THREE.PerspectiveCamera( 90, window.innerWidth / window.innerHeight, 1, 1000 )
    @camera.position.z = @size-(@size/3)

  __initGeometry: ->
    @createSkyBox()
    @createBoids()

  __initLights: ->
    edge =  @size/2
    directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 )
    directionalLight.position.set( -edge, -edge, -edge )
    @scene.add( directionalLight )

    directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 )
    directionalLight.position.set(edge,edge,edge)
    @scene.add( directionalLight )


    plight = new THREE.PointLight( 0xff0000, 1,edge)
    plight.position.set( 0, 0, 0 )
    @scene.add(plight )



  loop:->
    requestAnimationFrame =>
      @loop()
    @update()
    @renderer.render( @scene, @camera )

  update: ->
    for entity in @demoEntities
      entity.update(@demoEntities)

  createSkyBox: ->
    imagePrefix = "images/"
    directions  = ["xpos", "xneg", "ypos", "yneg", "zpos", "zneg"]
    imageSuffix = ".png"
    skyGeometry = new THREE.BoxGeometry( @size, @size, @size )
    materialArray = []
    i = 0
    while i < 6
      newMat = new THREE.MeshBasicMaterial({ map: THREE.ImageUtils.loadTexture( imagePrefix + directions[i] + imageSuffix ),side:THREE.BackSide})
      materialArray.push(newMat)
      i++
    skyMaterial = new THREE.MeshFaceMaterial( materialArray )
    skyBox = new THREE.Mesh( skyGeometry, skyMaterial )
    skyBox.position.set(0,@vertOff,0)
    @scene.add( skyBox )

  createBoids: ->
    i = 0
    while i < @flockCount
      randX = (Math.random()*(@size/5)) - (@size/10)
      randY = (Math.random()*(@size/5)) - (@size/10)
      randZ = (Math.random()*(@size/5)) - (@size/10)
      geometry = new THREE.CylinderGeometry(0,1,4,8,1)
      material = new THREE.MeshLambertMaterial( { color: 0x00ffff, wireframe: false} )
      themesh = new THREE.Mesh( geometry, material )
      themesh.position.set(randX,randY,randZ)
      boid = new Boid()
      xvel = Math.random()
      yvel = Math.random()
      zvel = Math.random()
      boid.init({behavior:new BehaviorFlock(boid), mesh:themesh, bounding:@size, velocity:new THREE.Vector3(xvel, yvel, zvel)})
      @scene.add(boid.mesh)
      @demoEntities.push(boid)
      ++i


module.exports = new FlockingDemo