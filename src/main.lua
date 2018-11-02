local sti = require "modules/sti"

function love.load()
  map = sti("tiled/test1.lua")
end

function love.update(dt)
  map:update(dt)
end

function love.draw()
  love.graphics.print("Hello World!", 400, 300)

  map:draw()
end

