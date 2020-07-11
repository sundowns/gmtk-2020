local physics =
  Concord.system(
  {_components.physics_body, "ENTITIES"},
  {_components.world, "WORLD"},
  {_components.thrust, _components.physics_body, _components.is_car, "CAR"}
)
function physics:update(dt)
  local world_component = self:get_world_component()
  if world_component then
    world_component:update(dt)
  end

  for i = 1, self.CAR.size do
    local car = self.CAR:get(i)
    local physics_body = car:get(_components.physics_body)
    local thrust = car:get(_components.thrust)

    local angle = physics_body.body:getAngle() - math.pi / 2 -- default is to the right, so rotate it up... i guess >_>

    local direction = Vector.fromPolar(angle):normalized()
    -- print(direction)

    local force = direction * thrust.strength
    -- https://love2d.org/wiki/Body:applyForce
    -- TODO: we can pass a point-of-action to make the force push the back of the car instead of from the centre
    physics_body.body:applyForce(force.x, force.y) -- think we need something to cap velocity, not sure how to do this in physics world
  end
end

function physics:populate_world()
  local car_spawn = Vector(love.graphics.getWidth() / 2, love.graphics.getHeight() * 0.8)
  local finish_spawn = Vector(love.graphics.getWidth() / 2, 0)

  local world_component = self:get_world_component()
  _assemblages.car:assemble(Concord.entity(self:getWorld()), world_component.world, car_spawn)

  _assemblages.finish:assemble(Concord.entity(self:getWorld()), world_component.world, finish_spawn)

  -- testing walls, TODO: remove
  _assemblages.wall:assemble(
    Concord.entity(self:getWorld()),
    world_component.world,
    Vector(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2),
    200,
    250,
    1
  )
end

function physics:get_world_component()
  local world_entity = self.WORLD:get(1)
  assert(world_entity, "There is no physics world ;_;")
  return world_entity:get(_components.world)
end
return physics
