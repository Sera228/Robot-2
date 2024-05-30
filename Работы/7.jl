using HorizonSideRobots

# Функция для перемещения робота вдоль границы
function iceout!(robot::Robot, side::HorizonSide)
    side1 = side  # Начальное направление
    side_for_move = right(side1)  # Направление для движения (правое от side1)
    n = 0  # Счетчик шагов

    # Пока не достигнута граница в направлении side1
    while isborder(robot, side1)
        n += 1  # Увеличиваем счетчик шагов
        along!(robot, side_for_move, n)  # Перемещаем робота в направлении side_for_move на n шагов
        side_for_move = inverse(side_for_move)  # Меняем направление движения на обратное
    end
end

# Функция для перемещения робота на заданное количество шагов в определенном направлении
function along!(robot::Robot, side::HorizonSide, n_steps::Int)
    for _ in 1:n_steps
        move!(robot, side)  # Перемещаем робота в заданном направлении
    end
end

# Функция для получения левого направления от заданного
function left(side::HorizonSide)::HorizonSide
    return HorizonSide(mod(Int(side) + 3, 4))  # Левое направление
end

# Функция для получения правого направления от заданного
function right(side::HorizonSide)::HorizonSide
    return HorizonSide(mod(Int(side) + 1, 4))  # Правое направление
end

# Функция для получения обратного направления от заданного
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide(mod(Int(side) + 2, 4))  # Обратное направление
end

# Пример использования
r = Robot(15, 15, animate=true)
iceout!(r, HorizonSide(0))  # Начинаем с направления вправо