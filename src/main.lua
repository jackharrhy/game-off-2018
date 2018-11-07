flux = require "modules/flux"

local sti = require "modules/sti"
local bump_sti = require "modules/sti/plugins/bump"
local entities = require "entities"
local bump = require "modules/bump"
local bump_debug = require "modules/bump_debug"

isDebugging = false

function love.load()
    map = sti("tiled/test2.lua")

    world = bump.newWorld(64)

    bump_sti.bump_init(map, world)

    entities:load()

    local entityLayer = map:addCustomLayer("entities", 5)
    entityLayer.draw = entities.draw
    entityLayer.update = entities.update

    love.graphics.setBackgroundColor(1,1,1)

    map:removeLayer("rooms")
    map:removeLayer("entities")
end

function love.update(dt)
    map:update(dt)
    flux.update(dt)
end

function love.draw()
    -- Reset to white so map draws correctly
    love.graphics.setLineWidth(1)
    love.graphics.setColor(1,1,1)

    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    local halfwidth = width / 2
    local border = 32

    -- Figure out which area of the map to render based on player location
    local player = entities.player
    local tx = math.floor(player.x / (halfwidth - border/2)) * (halfwidth - border/2)
    local ty = math.floor(player.y / height) * height

    map:draw(-tx, -ty)

    if isDebugging then
        love.graphics.setColor(0.75,0,0)
        bump_sti.bump_draw(map, world, -tx, -ty)
        bump_debug.draw(world)
    end

    -- Puzzle backdrop
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", halfwidth, 0, halfwidth, height)

    -- Border between internal windows
    love.graphics.setColor(0.1,0.1,0.1)
    love.graphics.rectangle("fill", halfwidth - border/2, 0, border, height)
end

function love.keypressed(k)
    if k == 'escape' then love.event.quit() end
    entities:keypressed(k)
end
