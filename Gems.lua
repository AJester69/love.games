local gems = {}

function gems.create(x, y, color)
    local gem = {
        x = x,
        y = y,
        color = color,
        size = 10,
    }
    table.insert(gems, gem)
end

function gems.checkCollisions(player)
    for i = #gems, 1, -1 do
        local gem = gems[i]
        if calculateDistance(player.x, player.y, gem.x, gem.y) < (player.radius + gem.size / 2) then
            table.remove(gems, i)
            _G.gemCount = _G.gemCount + 1
        end
    end
end

function gems.draw()
    for _, gem in ipairs(gems) do
        love.graphics.setColor(gem.color)
        love.graphics.rectangle("fill", gem.x - gem.size / 2, gem.y - gem.size / 2, gem.size, gem.size)
    end
end

function gems.update(dt)

end

return gems
