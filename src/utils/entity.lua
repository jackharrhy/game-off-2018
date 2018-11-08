local draw = require "utils/draw"

local entity = {}

function entity:updatePositionInWorld()
    world:update(self, self.x, self.y)
end

function entity:new()
    -- Default to x: 0, y: 0
    if self.x == nil then self.x = 0 end
    if self.y == nil then self.y = 0 end

    if self.properties ~= nil then
        local props = self.properties
        if props.spriteFile then self.spriteFile = props.spriteFile end
    end

    if not self.spriteFile then
        self.spriteFile = "art/" .. self.name .. ".png"
    end

    self.sprite = love.graphics.newImage(self.spriteFile)

    if not self.w then self.w = self.sprite:getWidth() end
    if not self.h then self.h = self.sprite:getHeight() end

    --[[if self.scale then
        self.ox = self.w / (self.scale * 8)
        self.oy = self.h / (self.scale * 8)
        self.w = self.w / (self.scale * 4)
        self.h = self.h / (self.scale * 4)
    end]]--

    self.x = self.x - self.w / 2
    self.y = self.y - self.h / 2

    if not self.w or not self.h then error("entity created without width or height!") end

    world:add(self, self.x, self.y, self.w, self.h)

    if self.color == nil then self.color = { r = 1, g = 1, b = 1 } end

    if self.draw == nil then self.draw = entity.draw end
end

function entity:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    draw.entity(self)
    if isDebugging then
        draw.debugsquare(self)
        draw.point(self)
    end
end

return entity