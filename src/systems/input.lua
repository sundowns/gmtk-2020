local input = Concord.system({_components.control})
-- TODO: we probably just want to flat out react to keys for obstacles, no need for binds I think
-- (actually maybe the individual obstacles have a control component..)
function input:init()
  self.timer = Timer.new()
  self.polling_rate = 0.01
  self.timer:every(
    self.polling_rate,
    function()
      self:poll_keys()
    end
  )
end
function input:poll_keys()
  for i = 1, self.pool.size do
    local control = self.pool:get(i):get(_components.control)
    for action, is_held in pairs(control.is_held) do
      if is_held then
        self:getWorld():emit("action_held", action, self.pool:get(i))
      end
    end
  end
end
function input:keypressed(key)
  for i = 1, self.pool.size do
    local control = self.pool:get(i):get(_components.control)
    local binds = control.binds
    if binds[key] and not control.is_held[key] then
      control.is_held[binds[key]] = true
      self:getWorld():emit("action_pressed", string.lower(binds[key]), self.pool:get(i))
    end
  end
end
function input:mousepressed(_, _, button)
  -- We dont care about x, y we just want to track the event (just poll the mouse position if needed)
  self:keypressed("mouse" .. button)
end
function input:mousereleased(_, _, button)
  -- We dont care about x, y we just want to track the event (just poll the mouse position if needed)
  self:keyreleased("mouse" .. button)
end
function input:keyreleased(key)
  for i = 1, self.pool.size do
    local control = self.pool:get(i):get(_components.control)
    local binds = control.binds
    if binds[key] and control.is_held[binds[key]] then
      control.is_held[binds[key]] = false
      self:getWorld():emit("action_released", string.lower(binds[key]), self.pool:get(i))
    end
  end
end
function input:update(dt)
  self.timer:update(dt)
end
return input
