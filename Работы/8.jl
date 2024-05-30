using HorizonSideRobots

# Функция для поиска маркера
function find_marker!(robot::Robot)
    k = 0  # Счетчик шагов
    side = Nord  # Начальное направление (Север)

    # Пока не найден маркер
    while !ismarker(robot)
        for _i in 1:2  # Движемся в двух направлениях
            along!(side, k, robot)  # Перемещаем робота в направлении side на k шагов
            side = right(side)  # Меняем направление на правое
        end
        k += 1  # Увеличиваем счетчик шагов
    end
end

# Функция для перемещения робота на заданное количество шагов в определенном направлении
function along!(side::HorizonSide, num_steps::Int, robot::Robot)
    for _i in 1:num_steps
        if !ismarker(robot)  # Если нет маркера, то перемещаем робота
            move!(robot, side)
        end
    end
end

# Функция для решения задачи: просто вызывает find_marker!
function solve!(robot::Robot)
    find_marker!(robot)
end

# Функция для получения правого направления от заданного
function right(side::HorizonSide)::HorizonSide
    return HorizonSide(mod(Int(side) + 1, 4))  # Правое направление
end