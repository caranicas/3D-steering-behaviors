###*
# The Main enterance Into my App
#
# @classView
# @constructor
#
###
_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
plugin     = require 'plugin'
THREE     = require 'three'

module.exports = Backbone.View.extend

  template: require './template.hbs'

  initialize: ->
    @render()

  render: ->
    @$el.html @template
    @threeInit()
    @animate()

  threeInit: ->
    @camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 10000 )
    @camera.position.z = 1000
    @scene = new THREE.Scene()
    @geometry = new THREE.BoxGeometry( 200, 200, 200 )
    @material = new THREE.MeshBasicMaterial( { color: 0xff0000, wireframe: true} )
    @mesh = new THREE.Mesh( @geometry, @material )
    @scene.add(@mesh)
    webcan = @$('#webgl-canvas')[0];
    debugger;
    @renderer = new THREE.WebGLRenderer({canvas:webcan})
    console.log('CANVAS', @renderer.domElement)
    @renderer.setSize( window.innerWidth, window.innerHeight )


    #document.body.appendChild( @renderer.domElement )

  animate:->
    requestAnimationFrame =>
      @animate()
    @mesh.rotation.x += 0.01
    @mesh.rotation.y += 0.02
    @renderer.render( @scene, @camera )


  setCamera: ->
    @camera.position.set(0,0,5)

  createCubes: ->
    @cubeList = []
    geometry = new THREE.BoxGeometry(1,1,1)
    material = new THREE.MeshLambertMaterial( { color: 0xff0000} )
    cube = new THREE.Mesh( geometry, material )
    cube.position.set(0,0,2)
    @scene.add(cube)
    @cubeList.push(cube)

    geometry2 = new THREE.BoxGeometry(1,1,1)
    material2 = new THREE.MeshLambertMaterial( { color: 0xff00ff} )
    cube2 = new THREE.Mesh( geometry2, material2 )
    cube2.position.set(0,0,-2)
    @scene.add(cube2)
    @cubeList.push(cube2)
    debugger

  renderGL: ->
    requestAnimationFrame =>
      console.log 'request'
      @renderGL

    @update()
    @renderer.render(@scene, @camera)

  update: ->
    for cube in @cubeList
      cube.rotation.x += 0.03
      cube.rotation.y += 0.03
