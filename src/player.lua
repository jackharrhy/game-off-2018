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

function player:update(dt)
    local speed = 130
    if love.keyboard.isDown("lshift") then
        speed = speed * 1.35
    end

    local targetX, targetY = self.x, self.y
    local checker = self.checker

    local w, a, s, d = key.getWASD()

    if w then
        if not d and checker.modx > 0 then checker.modx = 0 end
        if not a and checker.modx < 0 then checker.modx = 0 end

        checker.mody = -self.h
        targetY = targetY - speed * dt
    end

    if s then
        if not d and checker.modx > 0 then checker.modx = 0 end
        if not a and checker.modx < 0 then checker.modx = 0 end

        checker.mody = self.h
        targetY = targetY + speed * dt
    end

    if a then
        if not w and checker.mody < 0 then checker.mody = 0 end
        if not s and checker.mody > 0 then checker.mody = 0 end

        checker.modx = -self.w
        targetX = targetX - speed * dt
    end

    if d then
        if not w and checker.mody < 0 then checker.mody = 0 end
        if not s and checker.mody > 0 then checker.mody = 0 end

        checker.modx = self.w
        targetX = targetX + speed * dt
    end

    self.x, self.y = world:move(player, targetX, targetY, self.bumpFilter)

    checker.x = self.x + checker.modx * 1.2
    checker.y = self.y + checker.mody * 1.2
end

function player:bumpFilter(item, other)
    if item.properties.collide == false then
        return "cross"
    end
    return "slide"
end

function player:draw()
    entity.draw(self)
    if isDebugging then draw.debugsquare(self.checker) end
end

function player:keypressed(k)
    if k == "space" then
        if isDebugging then print("checking...") end

        local checker = self.checker
        local items, len = world:queryRect(checker.x,checker.y,checker.w,checker.h)

        for _, item in ipairs(items) do
            if isDebugging then print("interaction with:", item.name) end
            if item.interact ~= nil then item:interact() end
        end
    end
end

return player