-- e is the Entity being assembled.
return Concord.assemblage(
  function(e, physics_world, origin)
    e:give(
      _components.physics_body,
      physics_world,
      origin,
      "dynamic",
      love.physics.newRectangleShape(_constants.CAR.WIDTH, _constants.CAR.HEIGHT)
    ):give(_components.sprite, love.graphics.newImage("resources/sprites/car.png")):give(_components.thrust, 10)
  end
)
