local love = require "love"

local Text = require "components/Text"

function Bar(value, barX, barY, barWidth, barHeight, label, font_size, labelColor)
    value = value or 0.5
    label = label or "No label"
    font_size = font_size or "h3"
    labelColor = labelColor or { r = 1, g = 1, b = 1 }

    local function drawBar(x, y, value)
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", x, y, barWidth, barHeight)
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", x, y, barWidth * value, barHeight)
    end

    return {
        value = value,
        barX = barX or 0,
        barY = barY or 0,
        barWidth = barWidth or 200,
        barHeight = barHeight or 20,
        label = label,
        font_size = font_size,
        labelColor = labelColor,

        updateValue = function(self, newValue)
            self.value = math.max(0, math.min(1, newValue))
        end,

        draw = function(self)
            drawBar(self.barX, self.barY, self.value)

            love.graphics.setColor(self.labelColor.r, self.labelColor.g, self.labelColor.b)
            Text(
                self.label,
                self.barX,
                self.barY - 20,
                self.font_size,
                false,
                false,
                self.barWidth,
                "center",
                1
            ):draw()

            love.graphics.setColor(1, 1, 1)
        end
    }
end

return Bar