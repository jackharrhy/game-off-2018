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

    if isDebugging then
        love.graphics.setColor(0.75,0,0)
        bump_sti.bump_draw(map, world, -tx, -ty)
        bump_debug.draw(world)
    end

    -- Game 2 Black Backdrop
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", halfwidth, 0, halfwidth, height)

    -- Border
    love.graphics.setColor(0.1,0.1,0.1)
    love.graphics.rectangle("fill", halfwidth - border/2, 0, border, height)

    love.graphics.setColor(1,1,1)
end
