using HorizonSideRobots

r=Robot(15,15; animate=true)

#ЭТО ГРАНИЦУ СТРОИТ
function gobok(r::Robot)
    while isborder(r,HorizonSide(3))==false
    move!(r,HorizonSide(3))
    end
end
function buildp(r::Robot) 
hz = 0
while hz < 4 
    if isborder(r,HorizonSide(hz))==false
        move!(r,HorizonSide(hz))
        putmarker!(r)
    else
        hz += 1
    end
end
end
gobok(r)
buildp(r)