using HorizonSideRobots

r=Robot(15,15; animate=true)

#ЭТОТ ВСЁ ПОЛЕ КРАСИТ
function spiralka()
    hz = 3
    while true

    if ismarker(r)==false
    if isborder(r,HorizonSide(hz))==false
        putmarker!(r)
        move!(r,HorizonSide(hz))
    elseif (hz == 3)
        hz = 0
    elseif (hz == 0)
        hz = 1
    elseif (hz == 1)
        hz = 2
    end
    elseif (hz == 2)
        move!(r,HorizonSide(0))
        move!(r,HorizonSide(3))
        hz = 3
    elseif (hz == 3)
        move!(r,HorizonSide(1))
        move!(r,HorizonSide(0))
        hz = 0
    elseif (hz == 0)
        move!(r,HorizonSide(2))
        move!(r,HorizonSide(1))
        hz = 1
    elseif (hz == 1)
        move!(r,HorizonSide(3))
        move!(r,HorizonSide(2))
        hz = 2
    end

    end
end
spiralka()