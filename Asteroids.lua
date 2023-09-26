require "globals"

local love = require "love"
local gems = require "objects.Gems"


local gemColors = {
    { 0.0, 0.9, 0.7 },
    { 0.6, 0.3, 0.8 },
    { 0.0, 0.7, 0.5 },
    { 0.7, 0.1, 0.1 }
}

function Asteroids(x, y, ast_size, level, sfx)
    local ASTEROID_VERT = 20
    local ASTEROID_JAD = 0.2
    local ASTEROID_SPEED = math.random(50) + (level * 3) + 30

    if ast_size <= 20 then
        return nil
    end

    local vert = math.floor(math.random(ASTEROID_VERT + 1) + ASTEROID_VERT / 2)
    local offset = {}
    for i = 1, vert + 1 do
        table.insert(offset, math.random() * ASTEROID_JAD * 2 + 1 - ASTEROID_JAD)
    end

    local vel = -1
    if math.random() < 0.5 then
        vel = 1
    end

    local function getRandomGemColor()
        local randomGemColorIndex = love.math.random(1, #gemColors)
        local randomGemColor = gemColors[randomGemColorIndex]
        print("Selected Gem Color:", randomGemColor[1], randomGemColor[2], randomGemColor[3])
        return randomGemColor[1], randomGemColor[2], randomGemColor[3]
    end

    local asteroidR, asteroidG, asteroidB = getRandomGemColor()

    return {
        x = x,
        y = y,
        x_vel = math.random() * ASTEROID_SPEED * vel,
        y_vel = math.random() * ASTEROID_SPEED * vel,
        radius = math.ceil(ast_size / 2),
        angle = math.rad(math.random(math.pi)),
        vert = vert,
        offset = offset,
        r = asteroidR,
        g = asteroidG,
        b = asteroidB,

        draw = function (self, faded)
            local opacity = 1

            if faded then
                opacity = 0.2
            end

            love.graphics.setColor(self.r, self.g, self.b, opacity)

            local points = {
                self.x + self.radius * self.offset[1] * math.cos(self.angle),
                self.y + self.radius * self.offset[1] * math.sin(self.angle),
            }

            for i = 1, self.vert - 1 do
                table.insert(points, self.x + self.radius * self.offset[i + 1] * math.cos(self.angle + i * math.pi * 2 / self.vert))
                table.insert(points, self.y + self.radius * self.offset[i + 1] * math.sin(self.angle + i * math.pi * 2 / self.vert))
            end

            love.graphics.polygon(
                "fill",
                points
            )

            if show_debugging then
                love.graphics.setColor(1, 0, 0)
                love.graphics.circle("line", self.x, self.y, self.radius)
            end
        end,

        move = function (self, dt)
            self.x = self.x + self.x_vel * dt
            self.y = self.y + self.y_vel * dt

            if self.x + self.radius < 0 then
                self.x = love.graphics.getWidth() + self.radius
            elseif self.x - self.radius > love.graphics.getWidth() then
                self.x = -self.radius
            end
            if self.y + self.radius < 0 then
                self.y = love.graphics.getHeight() + self.radius
            elseif self.y - self.radius > love.graphics.getHeight() then
                self.y = -self.radius
            end
        end,

        destroy = function (self, asteroids_tbl, index, game)
            local MIN_ASTEROID_SIZE = math.ceil(ast_size / 8)

            if self.radius > MIN_ASTEROID_SIZE then
                gems.create(self.x, self.y, { self.r, self.g, self.b })
                table.insert(asteroids_tbl,  Asteroids(self.x, self.y, self.radius, game.level, sfx))
                table.insert(asteroids_tbl,  Asteroids(self.x, self.y, self.radius, game.level, sfx))
            end

            if self.radius >= ast_size / 2 then
                game.score = game.score + 20
            elseif self.radius <= MIN_ASTEROID_SIZE then
                game.score = game.score + 100
            else
                game.score = game.score + 50
            end

            if game.score > game.high_score then
                game.high_score = game.score
            end

            sfx:playFX("asteroid_explosion")
            table.remove(asteroids_tbl, index)
        end
    }
end

return Asteroids
