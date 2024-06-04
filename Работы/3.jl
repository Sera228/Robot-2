using HorizonSideRobots

# Создание робота в позиции (15, 15) с включенной анимацией
r = Robot(15, 15, animate=true)

# Функция для рисования спирали
function spiralka(r::Robot)
    hz = 3  # Начальное направление - вниз
    while true
        if !ismarker(r) && !isborder(r, HorizonSide(hz))
            putmarker!(r)  # Поставить маркер
            move!(r, HorizonSide(hz))  # Двигаться в направлении hz
        else
            if hz == 3
                hz = 0
            elseif hz == 0
                hz = 1
            elseif hz == 1
                hz = 2
            elseif hz == 2
                hz = 3
            end

            if ismarker(r)
                if hz == 3
                    move!(r, HorizonSide(1))  # Повернуть вправо и вверх
                    move!(r, HorizonSide(0))  # Повернуть вправо и вправо
                    hz = 0
                elseif hz == 0
                    move!(r, HorizonSide(2))  # Повернуть вправо и влево
                    move!(r, HorizonSide(1))  # Повернуть вправо и вверх
                    hz = 1
                elseif hz == 1
                    move!(r, HorizonSide(3))  # Повернуть вправо и вниз
                    move!(r, HorizonSide(2))  # Повернуть вправо и влево
                    hz = 2
                elseif hz == 2
                    move!(r, HorizonSide(0))  # Повернуть вправо и вправо
                    move!(r, HorizonSide(3))  # Повернуть вправо и вниз
                    hz = 3
                end
            end
        end
    end
end

# Запуск функции для рисования спирали
spiralka(r)
