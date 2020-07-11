local finish =
  Concord.system(
  {_components.physics_body, _components.is_goal, "GOALS"},
  {_components.thrust, _components.physics_body, _components.is_car, "CARS"}
)

function finish:init()
  self.game_over = false
end

function finish:goal_hit()
  self.game_over = true
  print("we touchin")
  -- TODO: maybe use a timer
end

function finish:update(_)
  if self.game_over then
    return
  end

  local car = self.CARS:get(1)
  if not car then
    return
  end

  local car_body = car:get(_components.physics_body).body
  for i = 1, self.GOALS.size do
    local goal = self.GOALS:get(i)
    local goal_body = goal:get(_components.physics_body).body
    if goal_body:isTouching(car_body) then
      self:goal_hit()
    end
  end
end

return finish
