local physics =
  Concord.system(
  {_components.physics_body, "ENTITIES"},
  {_components.world, "WORLD"},
  {_components.thrust, _components.physics_body, "CAR"}
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
    local direction = Vector(0, -1) -- Up. TODO: define a car's orientation and push along that

    local force = direction * thrust.strength
    physics_body.body:applyForce(force.x, force.y)
  end
end

function physics:populate_world()
  local car_spawn = Vector(love.graphics.getWidth() / 2, love.graphics.getHeight() * 0.8)

  local world_component = self:get_world_component()
  _assemblages.car:assemble(Concord.entity(self:getWorld()), world_component.world, car_spawn)
end

function physics:get_world_component()
  local world_entity = self.WORLD:get(1)
  assert(world_entity, "There is no physics world ;_;")
  return world_entity:get(_components.world)
end
return physics
