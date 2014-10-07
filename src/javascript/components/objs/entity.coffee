class Entity

  constructor: ->
    @

  init:(defaults) ->
    @behavior = defaults.behavior
    @mesh = defaults.mesh
    @acceleration = {x:0.01,y:0,z:0}
    @velocity = {x:0.1,y:0,z:0}
    console.log 'at mesh', @mesh

  update:(objs)->
    @behavior.update(objs)
    @updateVelocity()
    @updatePosition()

  updateVelocity: ->
    @velocity.x += @acceleration.x
    @velocity.y += @acceleration.y
    @velocity.z += @acceleration.z
    #@acceleration = {x:0,y:0,z:0}

  updateAcceleration: ->


  updatePosition: ->
    @mesh.position.x +=@velocity.x
    @mesh.position.y +=@velocity.y
    @mesh.position.z +=@velocity.z

  debugRender: ->

  getPosition: ->
    return @mesh.getPosition()

  getVelocity: ->
    return @mesh.getVelocity()

module.exports = Entity