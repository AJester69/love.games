local love = require "love"
local Button = require "components/Button"

function Settings(game)
    local funcs = {
        backToMenu = function()
            game.state.Settings = false
            game.state.menu = true
        end
    }

    local buttons = {
        Button(funcs.backToMenu, nil, nil, love.graphics.getWidth() / 3, 50, "Back to Menu", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.4),
    }

    return {
        focused = "",
        run = function(self, clicked)
            local mouse_x, mouse_y = love.mouse.getPosition()
            for name, button in pairs(buttons) do
                if button:checkHover(mouse_x, mouse_y, 10) then
                    if clicked then
                        button:click()
                    end

                    self.focused = name

                    button:setTextColor(0.8, 0.2, 0.2)
                else
                    button:setTextColor(1, 1, 1)
                end
            end
        end,

        draw = function(self)
            for _, button in pairs(buttons) do
                button:draw()
            end
        end
    }
end

return Settings