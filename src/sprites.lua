sprites = {}

function sprites:load(objects)
    for k, object in pairs(map.objects) do
        if object.name == "player" then
            self.player = require "player"
            self.player:init(object)
            break
        end
    end
end

function sprites:update(dt)
    sprites.player:update(dt)
end

function sprites:draw()
    sprites.player:draw()
end

return sprites