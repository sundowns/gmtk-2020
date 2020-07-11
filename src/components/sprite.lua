local sprite =
  Concord.component(
  function(e, image) -- TODO: take a spritesheet & quad probably, maybe array of frames or whatever
    e.image = image
  end
)

return sprite
