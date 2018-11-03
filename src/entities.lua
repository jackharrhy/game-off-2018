local player = require "player"

local entities = {
    signs = {}
}

function entities:load()
    for k, object in pairs(map.objects) do
        if object.name == "player" then
            self.player = player
            self.player:init(object)
        end

        if object.name == "sign" then
            world:add(object, object.x, object.y, 16, 16)
            table.insert(self.signs, object)
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