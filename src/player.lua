local draw = require "utils/draw"
local entity = require "utils/entity"

local player = {}

function player:init(tiledPlayer)
    self.name = tiledPlayer.name
    self.x = tiledPlayer.x
    self.y = tiledPlayer.y
    self.scale = 0.5
    entity.new(self)
end

function player:update(dt)
    local speed = 130
    if love.keyboard.isDown("lshift") then
        speed = speed * 1.35
    end

    local targetX, targetY = self.x, self.y

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        self.direction = "up"
        targetY = targetY - speed * dt
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        self.direction = "down"
        targetY = targetY + speed * dt
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        self.direction = "left"
        targetX = targetX - speed * dt
    end

    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        self.direction = "right"
        targetX = targetX + speed * dt
    end

    self.x, self.y = world:move(player, targetX, targetY, self.bumpFilter)
end

function player:bumpFilter(item, other)
    if item.properties.collide == false then
        return "cross"
    end
    return "slide"
end

function player:keypressed(k)
    if k == "space" then
        if isDebugging then
        end
    end
end

return player