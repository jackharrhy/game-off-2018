require "utils/entity"

local player = {
    spriteFile = "art/player.png"
}

function player:init(tiledPlayer)
    self.x = tiledPlayer.x
    self.y = tiledPlayer.y
    self.sprite = love.graphics.newImage(self.spriteFile)
    self.w = player.sprite:getWidth() / 2
    self.h = player.sprite:getWidth() / 2
    self.ox = self.w - self.w / 2
    self.oy = self.h - self.w / 2
    world:add(self, self.x, self.y, self.w, self.h)
end

function player:update(dt)
    local speed = 130
    if love.keyboard.isDown("lshift") then
        speed = speed * 1.5
    end

    local targetX, targetY = self.x, self.y

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        targetY = targetY - speed * dt
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        targetY = targetY + speed * dt
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        targetX = targetX - speed * dt
    end

    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        targetX = targetX + speed * dt
    end

    self.x, self.y = world:move(player, targetX, targetY)
end

function player:draw()
    entity.draw(player)

    if isDebugging then
        love.graphics.setColor(0,0,0)
        love.graphics.setPointSize(5)
        love.graphics.points(math.floor(self.x), math.floor(self.y))
        love.graphics.setColor(1,1,1)
    end
end

return player