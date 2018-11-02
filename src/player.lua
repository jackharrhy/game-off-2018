local player = {
    spriteFile = "art/player.png"
}

function player:init(tiledPlayer)
    self.x = tiledPlayer.x
    self.y = tiledPlayer.y
    self.sprite = love.graphics.newImage(self.spriteFile)
    self.oy = player.sprite:getHeight()
    self.ox = player.sprite:getWidth() / 2
end

function player:update(dt)
    local speed = 130
    if love.keyboard.isDown("lshift") then
        speed = speed * 1.5
    end

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        self.y = self.y - speed * dt
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        self.y = self.y + speed * dt
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        self.x = self.x - speed * dt
    end

    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        self.x = self.x + speed * dt
    end
end

function player:draw()
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

    -- FOR DEBUGGING PLAYER LOCATION
    love.graphics.setColor(0,0,0)
    love.graphics.setPointSize(5)
    love.graphics.points(math.floor(self.x), math.floor(self.y))
    love.graphics.setColor(255,255,255)
end

return player