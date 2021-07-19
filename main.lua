function love.load()
    debug = true

    require "field_logic"
    
    dim = 4
    field = generate_field(dim)
    spawn_tile(field)
    print_field(field)
end

function love.update(dt)

end

function love.draw()

end

function love.keypressed(k)
    if k == "escape" then love.event.quit()

    elseif k == "w" then move_up(field)     
    elseif k == "s" then move_down(field)   
    elseif k == "a" then move_right(field)  
    elseif k == "d" then move_left(field)   
    elseif k == "space" then spawn_tile(field); print_field(field) end
end