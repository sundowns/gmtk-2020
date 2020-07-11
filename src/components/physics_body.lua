local physics_body =
  Concord.component(
  function(e, physics_world, origin, body_type, shape)
    -- https://love2d.org/wiki/BodyType
    assert(origin and origin.x and origin.y, "Body component received a non-vector origin on creation")
    e.body = love.physics.newBody(physics_world, origin.x, origin.y, body_type)
    e.shape = shape
    e.fixture = love.physics.newFixture(e.body, e.shape)
  end
)

return physics_body
