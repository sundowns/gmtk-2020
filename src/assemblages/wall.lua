-- e is the Entity being assembled.
return Concord.assemblage(
  function(e, physics_world, origin, width, height, rotation)
    e:give(
      _components.physics_body,
      physics_world,
      origin,
      "static",
      love.physics.newRectangleShape(width, height),
      0,
      rotation,
      false
    )
  end
)
