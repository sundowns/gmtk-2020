function love.load()
    GamestateManager = require("libs.gamestate")
    require("loading")
    require("game")
    -- love.window.setIcon(love.image.newImageData("resources/sprites/icon.png"))
    GamestateManager.registerEvents()
    GamestateManager.switch(loading)
end

function love.update(_)
end

function love.draw()
end
