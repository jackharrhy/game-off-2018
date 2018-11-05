local draw = require "utils/draw"

local entity = {}

function entity:new()
    -- Default to x: 0, y: 0
    if self.x == nil then self.x = 0 end
    if self.y == nil then self.y = 0 end

    self.spriteFile = "art/" .. self.name .. ".png"
    self.sprite = love.graphics.newImage(self.spriteFile)

    if self.w == nil then self.w = self.sprite:getWidth() end
    if self.h == nil then self.h = self.sprite:getHeight() end

    if self.scale ~= nil then
        self.ox = self.w / (self.scale * 8)
        self.oy = self.h / (self.scale * 8)
        self.w = self.w / (self.scale * 4)
        self.h = self.h / (self.scale * 4)
    end

    self.x = self.x - self.w / 2
    self.y = self.y - self.h / 2

    if self.w == nil or self.h == nil then
        error("entity created without width or height!")
    end

    world:add(self, self.x, self.y, self.w, self.h)

    if self.color == nil then self.color = { r = 1, g = 1, b = 1 } end

    self.draw = entity.draw
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