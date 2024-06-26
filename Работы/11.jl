using HorizonSideRobots

# Создание робота с загрузкой ситуации из файла "11.sit" и включением анимации
r = Robot("11.sit"; animate=true)

# Функция для подсчета части периметра, ограниченного сверху
function rCountPartt(robot::Robot)
    side = Ost  # Начальное направление (Восток)
    count = 0  # Счетчик для подсчета длины части периметра
    cCheck = 0  # Счетчик для проверки наличия ограничения сверху
    cTotal = 0  # Общий счетчик для подсчета средней длины части периметра

    # Пока можно двигаться в направлении side
    while !isborder(robot, side)
        move!(robot, side)  # Перемещаем робота в направлении side

        # Если достигнута граница сверху
        if isborder(robot, Nord)
            count += 1  # Увеличиваем счетчик длины части периметра
            cCheck += 1  # Увеличиваем счетчик проверок
        else  # Если граница сверху не достигнута
            if count != 0 || cCheck != 0  # Если были пройдены какие-то части периметра
                cTotal += count / cCheck  # Добавляем среднюю длину части периметра к общему счетчику
                count = 0  # Сбрасываем счетчик длины части периметра
                cCheck = 0  # Сбрасываем счетчик проверок
            end
        end

        # Если достигнута граница в направлении side и можно двигаться вверх
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)  # Перемещаем робота вверх
            side = inverse(side)  # Меняем направление на обратное
            count = 0  # Сбрасываем счетчик длины части периметра
            cCheck = 0  # Сбрасываем счетчик проверок
        end
    end
    return cTotal  # Возвращаем общий счетчик
end

# Функция для получения обратного направления
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)  # Обратное направление
end

# Вызов функции для подсчета части периметра
rCountPartt(r)