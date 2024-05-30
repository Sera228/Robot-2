using HorizonSideRobots

# Функция для рекурсивного перемещения робота в заданном направлении и возвращения назад
function doubleDistant!(robot::Robot, side::HorizonSide, n::Int)
    if !isborder(robot, side)  # Если нет границы в направлении side
        move!(robot, side)  # Перемещаем робота в направлении side
        
        # Рекурсивно вызываем функцию doubleDistant! с увеличенным счетчиком n
        doubleDistant!(robot, side, n+1)
        
        if !isborder(robot, inverse(side))  # Если нет границы в обратном направлении
            n -= 1  # Уменьшаем счетчик n
            if n >= 0  # Если счетчик n не отрицателен
                move!(robot, inverse(side))  # Возвращаем робота назад в обратном направлении
                if isborder(robot, inverse(side))  # Если теперь есть граница в обратном направлении
                    return false  # Возвращаем false, так как робот не может продолжить движение
                end
                move!(robot, inverse(side))  # Еще раз возвращаем робота назад
            end
            if isborder(robot, inverse(side))  # Если теперь есть граница в обратном направлении
                if n - 1 < 0  # Если счетчик n стал отрицательным после возвращения
                    return false  # Возвращаем false, так как робот не может продолжить движение
                else
                    return true  # Возвращаем true, так как робот успешно вернулся
                end
            else        
                return true  # Возвращаем true, так как робот успешно вернулся
            end
        end
    end
end

# Функция для получения обратного направления
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)  # Обратное направление
end