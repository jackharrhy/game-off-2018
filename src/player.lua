local draw = require "utils/draw"
local key = require "utils/key"
local entity = require "utils/entity"

local player = {
    checker = {
        properties = {
            collide = false
        },
        mody = 0, modx = 0
    }
}

function player:init(tiledPlayer)
    self.name = tiledPlayer.name
    self.x = tiledPlayer.x
    self.y = tiledPlayer.y
    self.scale = 0.5
    entity.new(self)

    local checker = self.checker
    checker.x = self.x
    checker.y = self.y
    checker.w = self.w
    checker.h = self.h
    world:add(checker, checker.x, checker.y, checker.w, checker.h)
end

function player.checker:draw()
    draw.debugsquare(self)
end

function player:update(dt)
    local speed = 130
    if love.keyboard.isDown("lshift") then
        speed = speed * 1.35
    end

    local targetX, targetY = self.x, self.y

    local w, a, s, d = key.getWASD()

    if w then
        if not d and self.checker.modx > 0 then self.checker.modx = 0 end
        if not a and self.checker.modx < 0 then self.checker.modx = 0 end

        self.checker.mody = -self.h
        targetY = targetY - speed * dt
    end

    if s then
        if not d and self.checker.modx > 0 then self.checker.modx = 0 end
        if not a and self.checker.modx < 0 then self.checker.modx = 0 end

        self.checker.mody = self.h
        targetY = targetY + speed * dt
    end

    if a then
        if not w and self.checker.mody < 0 then self.checker.mody = 0 end
        if not s and self.checker.mody > 0 then self.checker.mody = 0 end

        self.checker.modx = -self.w
        targetX = targetX - speed * dt
    end

    if d then
        if not w and self.checker.mody < 0 then self.checker.mody = 0 end
        if not s and self.checker.mody > 0 then self.checker.mody = 0 end

        self.checker.modx = self.w
        targetX = targetX + speed * dt
    end

    self.x, self.y = world:move(player, targetX, targetY, self.bumpFilter)

    self.checker.x = self.x + self.checker.modx
    self.checker.y = self.y + self.checker.mody
end

function player:bumpFilter(item, other)
    if item.properties.collide == false then
        return "cross"
    end
    return "slide"
end

function player:keypressed(k)
    if k == "space" then
        if isDebugging then end
    end
end

return player