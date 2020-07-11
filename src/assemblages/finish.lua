-- e is the Entity being assembled.
return Concord.assemblage(
  function(e, physics_world, origin)
    e:give(
      _components.physics_body,
      physics_world,
      origin,
      "static",
      love.physics.newRectangleShape(_constants.FINISH.WIDTH, _constants.FINISH.HEIGHT),
      0,
      true
    ):give(_components.is_goal)
  end
)
