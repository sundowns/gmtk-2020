-- Draws polygonal shapes to the screen
local renderer =
  Concord.system({_components.sprite, _components.physics_body, "DRAWABLES"}, {_components.physics_body, "BODIES"})

function renderer:init()
  self.game_over = false
  -- Screen shake
  self.shake_screen = false
  self.shake_duration = 0
  self.shake_count = 0
  self.shake_magnitude = 2
end

function renderer:shake_screen(duration, magnitude)
  if self.shake_screen then
    return
  end
  self.shake_screen = true
  self.shake_duration = duration
  self.shake_magnitude = magnitude
end

function renderer:update(dt)
  if self.shake_screen then
    if self.shake_duration > self.shake_count then
      self.shake_count = self.shake_count + dt
    else
      self.shake_screen = false
      self.shake_count = 0
      self.shake_duration = 0
    end
  end
end

function renderer.draw_sprite(_, e)
  local sprite = e:get(_components.sprite)
  local physics_body = e:get(_components.physics_body)

  local velocity = Vector(physics_body.body:getLinearVelocity())
  local shmangle = Vector(0, -1):angleTo(velocity)

  -- if velocity:len() == 0 then
  --   shmangle = transform.rotation
  -- else
  --   transform.rotation = shmangle
  -- end

  local image = sprite.image
  love.graphics.draw(
    image,
    physics_body.body:getX(),
    physics_body.body:getY(),
    -shmangle,
    1,
    1,
    image:getWidth() / 2,
    image:getHeight() / 2
  )
end

function renderer.draw_debug_outline(_, e)
  local physics_body = e:get(_components.physics_body)
  if _DEBUG then
    love.graphics.polygon("line", physics_body.body:getWorldPoints(physics_body.shape:getPoints()))
  end
end

function renderer:draw()
  _util.l.reset_colour()

  if self.shake_screen then
    love.graphics.push()
    local dx = love.math.random(-self.shake_magnitude, self.shake_magnitude)
    local dy = love.math.random(-self.shake_magnitude, self.shake_magnitude)
    love.graphics.translate(dx / self.shake_count, dy / self.shake_count)
  end

  for i = 1, self.DRAWABLES.size do
    self:draw_sprite(self.DRAWABLES:get(i))
  end

  if _DEBUG then
    for i = 1, self.BODIES.size do
      self:draw_debug_outline(self.BODIES:get(i))
    end
  end

  if self.shake_screen then
    love.graphics.pop()
  end
end

return renderer
