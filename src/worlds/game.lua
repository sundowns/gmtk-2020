local game = Concord.world()

-- ADD SYSTEMS
game:addSystem(_systems.physics)
game:addSystem(_systems.renderer)
game:addSystem(_systems.finish)

return game
