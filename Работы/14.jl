using HorizonSideRobots
r=Robot(15,15; animate=true)

function TryToMove!(robot, side)
    if isborder(robot, side)
        return false
    else 
        move!(robot, side)
        return true
    end
end


function along!(robot, side)
    while TryToMove!(robot, side) 
    end
end

function snake!( robot, (move_side, next_row_side)::NTuple{2,HorizonSide} = (Nord, Ost)) 
    along!(robot, move_side)
    while TryToMove!(robot, next_row_side)
        move_side = inverse(move_side)
        along!(robot, move_side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
snake!(r)