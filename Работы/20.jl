using HorizonSideRobots

# Функция для перемещения робота в заданном направлении или обхода препятствия
function moveNext!(robot::Robot, side::HorizonSide)
    if !isborder(robot, side)  # Если нет границы в направлении side
        move!(robot, side)  # Перемещаем робота в направлении side
    else  # Если есть граница в направлении side
        move!(robot, right(side))  # Перемещаем робота вправо от направления side
        moveNext!(robot, side)  # Рекурсивно вызываем функцию moveNext! в направлении side
        move!(robot, left(side))  # Возвращаем робота назад влево от направления side
    end
end

# Функция для получения направления, которое находится справа от заданного направления
function right(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 1) % 4)  # Направление справа
end

# Функция для получения направления, которое находится слева от заданного направления
function left(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 3) % 4)  # Направление слева
end