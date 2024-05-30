using HorizonSideRobots

# Функция для размещения маркеров в шахматном порядке
function staggered_order_marker!(robot::Robot)
    imax, jmax = robot.situation.frame_size  # Размеры поля
    num_Sud, num_West = to_corner!(robot)  # Количество шагов до угла

    # Определение начального порядка размещения маркеров
    if (num_Sud + num_West) % 2 == 0
        staggered_order = 0
    else
        staggered_order = 1
    end

    side = Ost  # Начальное направление (Восток)
    while !isborder(robot, side)
        if staggered_order % 2 == 0  # Если порядок четный, ставим маркер
            putmarker!(robot)
        end
        move!(robot, side)  # Перемещаем робота в направлении side
        staggered_order += 1  # Увеличиваем порядок

        # Если достигнута граница и можно двигаться вверх
        if isborder(robot, side) && !isborder(robot, Nord)
            if staggered_order % 2 == 0  # Если порядок четный, ставим маркер
                putmarker!(robot)
            end
            move!(robot, Nord)  # Перемещаем робота вверх
            staggered_order += 1  # Увеличиваем порядок
            if staggered_order % 2 == 0  # Если порядок четный, ставим маркер
                putmarker!(robot)
            end
            side = inverse(side)  # Меняем направление на обратное
        end
    end
    putmarker!(robot)  # Ставим последний маркер

    # Определение направления движения обратно
    if jmax % 2 == 0
        num_West = jmax - 1 - num_West
        side_back = West
    else
        side_back = Ost
    end
    num_Sud = imax - 1 - num_Sud
    along!(robot, num_Sud, num_West, side_back)  # Возвращаем робота в исходную позицию
end

# Функция для перемещения робота в угол
function to_corner!(robot::Robot)
    num_West = 0
    num_Sud = 0
    while !isborder(robot, Sud)
        move!(robot, Sud)
        num_Sud += 1
    end
    while !isborder(robot, West)
        move!(robot, West)
        num_West += 1
    end
    return num_Sud, num_West
end

# Функция для перемещения робота назад
function along!(robot::Robot, num_Sud::Int, num_Ost::Int, side_back::HorizonSide)
    for _i in 1:num_Sud
        move!(robot, Sud)
    end
    for _i in 1:num_Ost
        move!(robot, side_back)
    end
end

# Функция для получения обратного направления
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)  # Обратное направление
end