game = {}
local _worlds = nil -- should not have visbility of each other...
_DEBUG = true -- TODO: not

function game:init()
  Concord = require("libs.concord")
  _components = Concord.components
  _systems = Concord.systems
  _worlds = Concord.worlds
  _assemblages = Concord.assemblages

  Concord.loadComponents("src/components")
  Concord.loadSystems("src/systems")
  Concord.loadWorlds("src/worlds")
  Concord.loadAssemblages("src/assemblages")

  _assemblages.world:assemble(Concord.entity(_worlds.game))
  _worlds.game:emit("populate_world")
end

function game:update(dt)
  _worlds.game:emit("update", dt)
end

function game:draw()
  _worlds.game:emit("draw")

  if _DEBUG then
    _util.l.render_stats()
  end
end

function game:keypressed(key, _, _)
  if key == "r" then
    love.event.quit("restart")
  elseif key == "escape" then
    love.event.quit()
  elseif key == "f1" then
    _DEBUG = not _DEBUG
  end

  _worlds.game:emit("keypressed", key)
end

function game:keyreleased(key)
  _worlds.game:emit("keyreleased", key)
end

function game:mousepressed(x, y, button, _, _)
  _worlds.game:emit("mousepressed", x, y, button)
end

function game:mousereleased(x, y, button, _, _)
  _worlds.game:emit("mousereleased", x, y, button)
end

function game:resize(w, h)
  _worlds.world:emit("resize", w, h)
end
