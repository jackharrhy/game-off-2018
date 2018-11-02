local sti = require "modules/sti"

function love.load()
  map = sti("tiled/test2.lua")

  love.graphics.setBackgroundColor(255,255,255)
end

function love.update(dt)
  map:update(dt)
end

function love.draw()
  map:drawTileLayer("mainart")
  map:drawTileLayer("secondaryart")
end
