local player = require "player"
local methods = require "methods"
local entity = require "utils/entity"

entities = {
    array = {},
}

function applyMethods(ent)
    if ent.name == "sign" then ent.interact = methods.sign.interact end
    if ent.name == "lever" then ent.interact = methods.lever.interact end
    if ent.name == "door" then ent.trigger = methods.door.trigger end
end

function entities:load()
    for k, object in pairs(map.objects) do
        if object.properties.ignore ~= true then
            if isDebugging then print("loading ent: ", object.name) end
            if object.name == "player" then
                self.player = player
                self.player:init(object)
                table.insert(self.array, player)
            elseif object.properties.collide ~= nil then
                entity.new(object)
                applyMethods(object)

                if object.properties.id then
                    self.array[object.properties.id] = object
                end

                table.insert(self.array, object)
            end
        end
    end
end

function entities:update(dt)
    for _, ent in ipairs(entities.array) do
        if ent.update then ent:update(dt) end
    end
end

function entities:draw()
    for _, ent in ipairs(entities.array) do
        if ent.draw then ent:draw() end
    end
end

function entities:keypressed(k)
    entities.player:keypressed(k)
end

return entities