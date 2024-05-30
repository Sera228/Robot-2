using HorizonSideRobots

# Функция для размещения маркеров по периметру
function mark_perimeter(r::Robot)
    # Помечаем внешний периметр
    mark_border(r, HorizonSide(0))  # Вправо
    mark_border(r, HorizonSide(1))  # Вверх
    mark_border(r, HorizonSide(2))  # Влево
    mark_border(r, HorizonSide(3))  # Вниз

    # Помечаем внутренний периметр
    # Предполагаем, что внутренняя перегородка находится слева от робота
    move_to_inner_border(r)
    mark_border(r, HorizonSide(0))  # Вправо
    mark_border(r, HorizonSide(1))  # Вверх
    mark_border(r, HorizonSide(2))  # Влево
    mark_border(r, HorizonSide(3))  # Вниз
end

# Функция для размещения маркеров по границе
function mark_border(r::Robot, side::HorizonSide)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end

# Функция для перемещения к внутренней перегородке
function move_to_inner_border(r::Robot)
    # Предполагаем, что внутренняя перегородка находится слева
    while !isborder(r, HorizonSide(2))
        move!(r, HorizonSide(2))
    end
end

# Основная программа
function main()
    r = Robot("map.sit", animate=true)
    mark_perimeter(r)
end

main()