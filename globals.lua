local json = require("json")

ASTEROID_SIZE = 100
show_debugging = false
destroy_ast = false

function calculateDistance(x1, y1, x2, y2)
    return math.sqrt(((x2 - x1) ^ 2) + ((y2 - y1) ^ 2))
end

function readJSON(file_name)
    local data = love.filesystem.read("src/data/" .. file_name .. ".json")
    if data then
        return json.decode(data)
    else
        return nil
    end
end

function writeJSON(file_name, data)
    local encoded_data = json.encode(data)
    love.filesystem.write("src/data/" .. file_name .. ".json", encoded_data)
end
