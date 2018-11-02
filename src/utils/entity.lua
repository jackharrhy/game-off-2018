entity = {}

function entity:draw(entity)
    love.graphics.draw(
        self.sprite,
        math.floor(self.x),
        math.floor(self.y),
        0,
        1,
        1,
        self.ox,
        self.oy
    )
end

return entity