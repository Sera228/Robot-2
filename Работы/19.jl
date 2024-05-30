using HorizonSideRobots

# Функция рекурсивного перемещения робота в заданном направлении с разметкой границ
function moveRecMarker!(robot::Robot, side::HorizonSide)
    if isborder(robot, side)  # Если есть граница в направлении side
        putmarker!(robot)  # Помечаем текущую клетку маркером
    else  # Если границы нет
        move!(robot, side)  # Перемещаем робота в направлении side
        moveRecMarker!(robot, side)  # Рекурсивно вызываем функцию moveRecMarker!
        move!(robot, inverse(side))  # Возвращаем робота на предыдущую клетку
    end
end

# Функция для получения обратного направления
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)  # Обратное направление
end