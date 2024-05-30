using HorizonSideRobots

# Создайте робота в позиции (15, 15) с включенной анимацией.
r = Robot(15, 15, animate=true)

# Функция для размещения маркеров в заданном направлении
function putmarkers!(r::Robot, side::HorizonSide)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end

# Функция для перемещения робота назад, следуя указателям
function move_by_markers(r::Robot, side::HorizonSide)
    while ismarker(r)
        move!(r, inverse(side))
    end
end

# Функция для изменения направления движения
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side) + 2, 4))
end

# Функция для рисования креста
function mark_kross(r::Robot)
    for side in (HorizonSide(i) for i in 0:3)
        putmarkers!(r, side)
        move_by_markers(r, inverse(side))
    end
    putmarker!(r)
end

# Функция перемещения робота в центр
function gocentre(r::Robot)
    for _ in 1:7
        move!(r, HorizonSide(3))  # Move left
        move!(r, HorizonSide(0))  # Move up
    end
end

# Переместитесь в центр
gocentre(r)

# Нарисуй крест
mark_kross(r)