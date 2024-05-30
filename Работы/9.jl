using HorizonSideRobots

# Функция для поиска маркера
function find_marker!(robot::Robot)
    num_step = 1  # Начальное количество шагов
    side = Nord  # Начальное направление (Север)

    # Пока не найден маркер
    while !ismarker(robot)
        for _i in 1:2  # Движемся в двух направлениях
            marker_is_find!(robot, side, num_step)  # Ищем маркер в направлении side на num_step шагов
            side = next(side)  # Меняем направление на следующее
        end
        num_step += 1  # Увеличиваем количество шагов
    end
end

# Функция для поиска маркера на заданном количестве шагов в определенном направлении
function marker_is_find!(robot::Robot, side::HorizonSide, num_step::Int)
    for _i in 1:num_step
        if !ismarker(robot)  # Если нет маркера, то перемещаем робота
            move!(robot, side)
        else
            break  # Если маркер найден, прерываем цикл
        end
    end
end

# Функция для получения следующего направления
function next(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 1) % 4)  # Следующее направление
end