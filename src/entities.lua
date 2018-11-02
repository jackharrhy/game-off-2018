local entities = {}

function entities:load()
    for k, object in pairs(map.objects) do
        if object.name == "player" then
            self.player = require "player"
            self.player:init(object)
            break
        end
    end
end

function entities:update(dt)
    entities.player:update(dt)
end

function entities:draw()
    entities.player:draw()
end

return entities