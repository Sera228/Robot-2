using HorizonSideRobots
function moveRec!(robot::Robot, side::HorizonSide)
    if !isborder(robot, side)
        
        move!(robot, side)
        moveRec!(robot, side)
    end
end