class Entity

  constructor: ->
    @

  init:(defaults) ->
    #@mesh = defaults.mesh
    #@acceleration = defaults.acceleration
    #@velocity = defaults.velocity

  update: ->
    @updateVelocity()
    @updatePosition()

  updateVelocity: ->

  updateAcceleration: ->

  updatePosition: ->

  debugRender: ->

  getPosition: ->
    return @mesh.getPosition()

  getVelocity: ->
    return @mesh.getVelocity()

module.exports = Entity