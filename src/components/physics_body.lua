local physics_body =
  Concord.component(
  function(e, physics_world, origin, body_type, shape, linear_damping, is_sensor)
    -- https://love2d.org/wiki/BodyType
    assert(origin and origin.x and origin.y, "Body component received a non-vector origin on creation")
    e.body = love.physics.newBody(physics_world, origin.x, origin.y, body_type)
    if linear_damping then
      e.body:setLinearDamping(linear_damping)
    end
    e.shape = shape
    e.fixture = love.physics.newFixture(e.body, e.shape)
    if is_sensor then
      e.fixture:setSensor(is_sensor)
    end
  end
)

return physics_body
