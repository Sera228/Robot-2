# Функция для перемещения робота в заданном направлении на определенное количество шагов, пока не выполнится условие остановки
function along!(stop_condition::Function, robot::Robot, side::HorizonSide, k::Int)
    for i in 1:k  # Перемещаем робота k шагов в направлении side
        if stop_condition(robot)  # Если выполнилось условие остановки
            return  # Завершаем функцию
        end
        move!(robot, side)  # Перемещаем робота в направлении side
    end
end

# Функция для движения робота по спирали, пока не выполнится условие остановки
function spiral!(stop_condition::Function, robot::Robot)
    k = 1  # Начальное количество шагов в каждом направлении
    while !stop_condition(robot)  # Пока условие остановки не выполнено
        along!(stop_condition, robot, Nord, k)  # Перемещаем робота вверх на k шагов
        along!(stop_condition, robot, Ost, k)  # Перемещаем робота вправо на k шагов
        along!(stop_condition, robot, Sud, k + 1)  # Перемещаем робота вниз на k + 1 шагов
        along!(stop_condition, robot, West, k + 1)  # Перемещаем робота влево на k + 1 шагов
        k += 2  # Увеличиваем количество шагов для следующего витка спирали
    end
end