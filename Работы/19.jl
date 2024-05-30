using HorizonSideRobots
function moveRecMarker!(robot::Robot, side::HorizonSide)
    if isborder(robot, side)
        putmarker!(robot)
    else
        move!(robot, side)
        moveRecMarker!(robot, side)
        move!(robot, inverse(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)