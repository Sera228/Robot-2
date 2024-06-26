using HorizonSideRobots

# Создание робота с загрузкой ситуации из файла "12.sit" и включением анимации
r = Robot("12.sit"; animate=true)

# Функция для подсчета частей периметра, ограниченных сверху
function count_partitions(robot::Robot)
    side = Ost  # Начальное направление (Восток)
    count = 0  # Счетчик для подсчета длины части периметра
    count_check = 0  # Счетчик для проверки наличия ограничения сверху
    count_blank = 0  # Счетчик для подсчета пустых клеток
    count_total = 0  # Общий счетчик для подсчета средней длины части периметра

    # Пока можно двигаться в направлении side
    while !isborder(robot, side)
        move!(robot, side)  # Перемещаем робота в направлении side

        # Если достигнута граница сверху
        if isborder(robot, Nord)
            count_blank = 0  # Сбрасываем счетчик пустых клеток
            count += 1  # Увеличиваем счетчик длины части периметра
            count_check += 1  # Увеличиваем счетчик проверок
        elseif !isborder(robot, Nord)  # Если граница сверху не достигнута
            count_blank += 1  # Увеличиваем счетчик пустых клеток
            if count_blank <= 1  # Если пустых клеток не больше одной
                count += 1  # Увеличиваем счетчик длины части периметра
                count_check += 1  # Увеличиваем счетчик проверок
            else  # Если пустых клеток больше одной
                if count == 0 || count_check == 0  # Если не было пройдено ни одной части периметра
                    count_total += 0  # Добавляем 0 к общему счетчику
                else  # Если были пройдены какие-то части периметра
                    count_total += count / count_check  # Добавляем среднюю длину части периметра к общему счетчику
                    count = 0  # Сбрасываем счетчик длины части периметра
                    count_check = 0  # Сбрасываем счетчик проверок
                end
            end
        end

        # Если достигнута граница в направлении side и можно двигаться вверх
        if isborder(robot, side) && !isborder(robot, Nord)
            if count_blank <= 1  # Если пустых клеток не больше одной
                if count == 0 || count_check == 0  # Если не было пройдено ни одной части периметра
                    count_total += 0  # Добавляем 0 к общему счетчику
                else  # Если были пройдены какие-то части периметра
                    count_total += count / count_check  # Добавляем среднюю длину части периметра к общему счетчику
                    count = 0  # Сбрасываем счетчик длины части периметра
                    count_check = 0  # Сбрасываем счетчик проверок
                end
            end
            move!(robot, Nord)  # Перемещаем робота вверх
            side = inverse(side)  # Меняем направление на обратное
            count = 0  # Сбрасываем счетчик длины части периметра
            count_check = 0  # Сбрасываем счетчик проверок
        end
    end
    return count_total  # Возвращаем общий счетчик
end

# Функция для получения обратного направления
function inverse(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)  # Обратное направление
end

# Вызов функции для подсчета частей периметра
count_partitions(r)