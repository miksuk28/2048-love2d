function love.load()
    require "field_logic"
    
    dim = 4
    field = generate_field(dim)
    spawn_tile(field)
    print_field(field)
end

function love.update(dt)
    --print("love.update")
end

function love.draw()

end

function love.keypressed(k)
    if k == "escape" then love.event.quit() end

    if k == "w" then move_up(field) end
    if k == "s" then spawn_tile(field); print_field(field) end
end