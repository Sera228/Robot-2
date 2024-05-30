using HorizonSideRobots
r=Robot(15,15; animate=true)

function perimetr_markers(r::Robot)
    for side in (HorizonSide(i) for i=[3,0,1,2])
        while isborder(r, side) == false
        move!(r,side)
        end
        putmarker!(r)
    end
end
perimetr_markers(r)