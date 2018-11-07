local entity = require "utils/entity"

local methods = {
    sign = {
        interact = function(self)
            print(self.properties.text)
        end
    },
    lever = {
        interact = function(self)
            if self.properties.triggerType == "door" then
                entities.array[self.properties.triggers]:trigger()
            end
        end
    },
    door = {
        trigger = function(self)
            if not self.movedYet then
                local props = self.properties
                local tween = flux.to(self, props.delay, {
                    x = self.x + props.translateX,
                    y = self.y + props.translateY,
                })

                tween:onupdate(function() entity.updatePositionInWorld(self) end)
                self.movedYet = true
            end
        end
    }
}

return methods