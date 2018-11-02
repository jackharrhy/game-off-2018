local sti = require "modules/sti"
local entities = require "entities"

function love.load()
    map = sti("tiled/test2.lua")
    entities:load(map.objects)

    local entityLayer = map:addCustomLayer("entities", 5)
    entityLayer.draw = entities.draw
    entityLayer.update = entities.update

    love.graphics.setBackgroundColor(1,1,1)
end

function love.update(dt)
    map:update(dt)
end

function love.draw()
    local width = love.graphics.getWidth()
    local halfwidth = width / 2
    local height = love.graphics.getHeight()

    border = 32

    local player = entities.player
    local tx = math.floor(player.x / (halfwidth - border/2)) * (halfwidth - border/2)
    local ty = math.floor(player.y / height) * height

    map:draw(-tx, -ty)

    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", halfwidth, 0, halfwidth, height)

    -- Border
    love.graphics.setColor(0.1,0.1,0.1)
    love.graphics.rectangle("fill", halfwidth - border/2, 0, border, height)

    love.graphics.setColor(1,1,1)
end
