local sti = require "modules/sti"
local sprites = require "sprites"

function love.load()
    map = sti("tiled/test2.lua")
    sprites:load(map.objects)

    local spriteLayer = map:addCustomLayer("sprites", 5)
    spriteLayer.draw = sprites.draw
    spriteLayer.update = sprites.update

    love.graphics.setBackgroundColor(255,255,255)
end

function love.update(dt)
    map:update(dt)
end

function love.draw()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local player = sprites.player
    local tx = math.floor(player.x / 800) * 800
    local ty = math.floor(player.y / 600) * 600

    love.graphics.translate(-tx, -ty)
    map:draw(-tx, -ty)
end
