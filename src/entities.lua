local player = require "player"
local entity = require "utils/entity"

local entities = {
    array = {}
}

function applyMethods(ent)
    if ent.name == "sign" then ent.interact = function()
        print(ent.properties.text)
    end end

    if ent.name == "test_circle" then ent.interact = function()
    end end
end

function entities:load()
    if isDebugging then print("LOADING ENTITIES") end
    for k, object in pairs(map.objects) do
        if object.properties.ignore ~= true then
            if isDebugging then print("ent: ", object.name) end
            if object.name == "player" then
                self.player = player
                self.player:init(object)
                table.insert(self.array, player)
            end

            if object.properties.collide ~= nil then
                entity.new(object)
                applyMethods(object)
                table.insert(self.array, object)
            end
        end
    end
end

function entities:update(dt)
    for _, ent in ipairs(entities.array) do
        if ent.update ~= nil then ent:update(dt) end
    end
end

function entities:draw()
    for _, ent in ipairs(entities.array) do
        if ent.draw ~= nil then ent:draw() end
    end
end

function entities:keypressed(k)
    entities.player:keypressed(k)
end

return entities