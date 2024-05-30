using HorizonSideRobots

r=Robot("map.sit"; animate=true)

#ЭТО ГРАНИЦУ СТРОИТ
function gobok(r::Robot)
    hz = 3
while !(isborder(r,HorizonSide(2))==true && hz == 2)
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
end
end

function searchp()
count = 0
hz = 0
while true
if isborder(r,HorizonSide(hz))==false
    move!(r,HorizonSide(hz))
    count += 1
elseif (count == 14)
    count = 0
    move!(r,HorizonSide(3))
    if hz == 0
    hz = 2
    else hz == 2
    hz = 0
    end
elseif (count != 14)
    break;
end
end
end
#ВВЕРХ 0 ВНИЗ 2 ВЛЕВО 3 ВПРАВО 1
function paintnextborder()
hz = 1
hzup = 0
while true
    if (isborder(r,HorizonSide(0)) == true)
        hzup = 0
        putmarker!(r)
        move!(r,HorizonSide(3))
    end
    if (isborder(r,HorizonSide(3)) == true)
        hzup = 3
        putmarker!(r)
        move!(r,HorizonSide(2))
    end
    if (isborder(r,HorizonSide(2)) == true)
        hzup = 2
        putmarker!(r)
        move!(r,HorizonSide(1))
    end
    if (isborder(r,HorizonSide(1)) == true)
        hzup = 1
        putmarker!(r)
        move!(r,HorizonSide(0))
    end
    if ((isborder(r,HorizonSide(0)) == false) && (isborder(r,HorizonSide(1)) == false) && (isborder(r,HorizonSide(2)) == false) && (isborder(r,HorizonSide(3)) == false))
        putmarker!(r)
        move!(r,HorizonSide(hzup))
    end
end
end

gobok(r)
searchp()
paintnextborder()