using HorizonSideRobots

# Функция рекурсивного перемещения робота в заданном направлении
function moveRec!(robot::Robot, side::HorizonSide)
    if !isborder(robot, side)  # Если нет границы в направлении side
        move!(robot, side)  # Перемещаем робота в направлении side
        moveRec!(robot, side)  # Рекурсивно вызываем функцию moveRec!
    end
end