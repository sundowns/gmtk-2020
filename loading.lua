loading = {}
local splash_displaying = false
local splash_screen = nil
local MINIMUM_LOAD_TIME = 0 -- 1.25
local load_timer = 0

function loading.init(_)
  love.graphics.setDefaultFilter("nearest", "nearest", 4)
  splash_screen = love.graphics.newImage("resources/misc/splashscreen.png")
end

function loading.enter(_, _, _, _)
end

function loading.leave(_)
end

function loading:update(dt)
  if splash_displaying and load_timer > MINIMUM_LOAD_TIME then
    self:load_game()
  end

  splash_displaying = true
  load_timer = load_timer + dt
end

function loading.draw(_)
  love.graphics.draw(
    splash_screen,
    0,
    0,
    0,
    love.graphics:getWidth() / splash_screen:getWidth(),
    love.graphics.getHeight() / splash_screen:getHeight()
  )
end

function loading.load_game(_)
  love.graphics.setDefaultFilter("nearest", "nearest", 0)
  -- Globals
  Vector = require("libs.vector")
  Timer = require("libs.timer")
  _constants = require("src.constants")
  _util = require("libs.util")
  -- _sprites = require("src.sprites")
  -- _audio = require("src.audio")

  -- _fonts = {
  --   ["SCORE_COUNTER"] = love.graphics.newFont("resources/fonts/whitrabt.ttf", 48),
  --   ["FINAL_SCORE"] = love.graphics.newFont("resources/fonts/whitrabt.ttf", 36),
  --   ["RESTART"] = love.graphics.newFont("resources/fonts/whitrabt.ttf", 24),
  --   ["CONTROLS"] = love.graphics.newFont("resources/fonts/whitrabt.ttf", 16)
  -- }

  GamestateManager.switch(game)
end
