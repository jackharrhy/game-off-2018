local key = {}

key.isDown = function(k)
    if k == "w" then return love.keyboard.isDown(k) or love.keyboard.isDown("up") end
    if k == "s" then return love.keyboard.isDown(k) or love.keyboard.isDown("down") end
    if k == "a" then return love.keyboard.isDown(k) or love.keyboard.isDown("left") end
    if k == "d" then return love.keyboard.isDown(k) or love.keyboard.isDown("right") end
end

key.getWASD = function()
    return key.isDown("w"), key.isDown("a"), key.isDown("s"), key.isDown("d")
end

return key