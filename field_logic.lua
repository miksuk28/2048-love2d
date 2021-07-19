-- field.lua

function generate_field(dim)
    -- generates an empty, square field with the given dimention
    local field = {}
    for y = 1, dim do
        local x_field = {}
        for x = 1, dim do
            table.insert(x_field, 0)
        end
        table.insert(field, x_field)
    end
    
    return field
end


function spawn_tile(field, nums)
    -- spawns a tile (or multiple) at a random empty location
    if check_space(field) then
        local number = 0
        local nums = nums or 1

        for i = 1, nums do
            if love.math.random(1, 10) == 10 then
                number = 4
            else
                number = 2
            end

            while true do
                x_rand = love.math.random(1, #field[1])
                y_rand = love.math.random(1, #field)

                if field[y_rand][x_rand] == 0 then break end
            end

            field[y_rand][x_rand] = number
        end
    end
end


function print_field(field)
    -- prints the field into the console
    for y = 1, #field do
        local row = ""
        for x = 1, #field[1] do
            row = row .. field[y][x] .. " "
        end
        print(row)
    end
    print("\n")
end


function check_space(field)
    -- returns true if field has empty space (0)
    for y = 1, #field do
        for x = 1, #field[1] do
            if field[y][x] == 0 then
                return true
            end
        end
    end

    return false
end


--[[    MOVEMENT AND STUFF    ]]--

-- husk å tenke over at x og y posisjonen endrer seg når move_up() blir køyrt

function move_field(field, direction)
    for y = 1, #field do
        for x = 1, #field[1] do
            if direction == "up" then
                move_up(field, x, y)
            end
        end
    end

    print_field(field)
end

function can_move(field, x, y, direction)
    if direction == "up" then
        if y > 1 then
            if field[y-1][x] == 0 then
                return true
            end
        end

        return false
    elseif direction == "down" then
        if y < #field then
            if field[y+1][x] == 0 then
                return true
            end
        end

        return false

    elseif direction == "left" then
        if x > 1 then
            if field[y][x-1] == 0 then
                return true
            end
        end

        return false

    elseif direction == "right" then
        if x < #field[1] then
            if field[y][x+1] == 0 then
                return true
            end
        end

        return false
    end
end


function move_up(field)
    local moved = true
    if debug then print("trying to move") end
    while moved do
        moved = false

        for y=1, #field do
            for x=1, #field[1] do
                if can_move(field, x, y, "up") and field[y][x] ~= 0 then
                    moved = true
                    field[y-1][x] = field[y][x]
                    field[y][x] = 0
                end
            end
        end
        if debug then print(moved) end
    end

    if debug then print_field(field) end
end

function move_down(field)
    local moved = true
    if debug then print("trying to move") end
    while moved do
        moved = false

        for y=1, #field do
            for x=1, #field[1] do
                if can_move(field, x, y, "down") and field[y][x] ~= 0 then
                    moved = true
                    field[y+1][x] = field[y][x]
                    field[y][x] = 0
                end
            end
        end
        if debug then print(moved) end
    end

    if debug then print_field(field) end
end