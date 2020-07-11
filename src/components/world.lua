local world =
  Concord.component(
  function(e, xg, yg, can_sleep)
    e.world = love.physics.newWorld(xg, yg, can_sleep)
  end
)

function world:update(dt)
  self.world:update(dt)
end

return world
