-- e is the Entity being assembled.
return Concord.assemblage(
  function(e)
    love.physics.setMeter(64)
    e:give(_components.world, 0, 0, true)
  end
)
