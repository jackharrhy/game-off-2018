local draw = {}

function draw:entity()
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

function draw:point()
    love.graphics.setColor(0,0,0)
    love.graphics.setPointSize(5)
    love.graphics.points(math.floor(self.x), math.floor(self.y))
end

function draw:debugsquare()
    love.graphics.setColor(0,0.65,0.65,0.75)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setLineWidth(1)
end

return draw