local player = require "player"
local entity = require "utils/entity"

local entities = {
    array = {}
}

function entities:load()
    if isDebugging then print("LOADING ENTITIES") end
    for k, object in pairs(map.objects) do
        if object.properties.ignore ~= true then
            if isDebugging then print("ent: ", object.name) end
            if object.name == "player" then
                self.player = player
                self.player:init(object)
            end

            if object.properties.collide ~= nil then
                entity.new(object)
                table.insert(self.array, object)
            end
        end
    end
end

function entities:update(dt)
    entities.player:update(dt)
end

function entities:draw()
    entities.player:draw()

    for _, ent in ipairs(entities.array) do
        ent:draw()
    end
end

function entities:keypressed(k)
    entities.player:keypressed(k)
end

return entities