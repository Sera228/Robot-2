using HorizonSideRobots

# Создание робота с загрузкой ситуации из файла "13.sit" и включением анимации
r = Robot("13.sit"; animate=true)

# Функция для попытки перемещения робота в заданном направлении
function TryToMove!(robot::Robot, side::HorizonSide)::Bool
    if isborder(robot, side)  # Если есть граница в направлении side
        return false  # Возвращаем false, что означает, что перемещение невозможно
    else  # Если границы нет
        move!(robot, side)  # Перемещаем робота в направлении side
        return true  # Возвращаем true, что означает успешное перемещение
    end
end

# Функция для перемещения робота в заданном направлении до границы
function along!(robot::Robot, side::HorizonSide)
    while TryToMove!(robot, side)  # Пока перемещение возможно
    end
end

# Функция для движения робота по "змейке"
function snake!(robot::Robot, (move_side, next_row_side)::NTuple{2,HorizonSide} = (Nord, Ost))
    along!(robot, move_side)  # Перемещаем робота в направлении move_side
    while TryToMove!(robot, next_row_side)  # Пока перемещение в направлении next_row_side возможно
        move_side = inverse(move_side)  # Меняем направление движения на обратное
        along!(robot, move_side)  # Перемещаем робота в новом направлении
    end
end

# Функция для получения обратного направления
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)  # Обратное направление
end

# Вызов функции для движения робота по "змейке"
snake!(r)
