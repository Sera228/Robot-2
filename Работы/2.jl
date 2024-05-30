using HorizonSideRobots

# Создание робота в позиции (15, 15) с включенной анимацией
r = Robot(15, 15, animate=true)

# Функция для перемещения робота вдоль правой границы
function gobok(r::Robot)
    while !isborder(r, HorizonSide(3))  # HorizonSide(3) соответствует движению влево
        move!(r, HorizonSide(3))
    end
end

# Функция для построения периметра путем размещения маркеров
function buildp(r::Robot)
    hz = 0  # Инициализация индекса направления
    while hz < 4  # Цикл по всем четырем направлениям (0: вверх, 1: влево, 2: ввниз, 3: вправо)
        if !isborder(r, HorizonSide(hz))
            move!(r, HorizonSide(hz))
            putmarker!(r)
        else
            hz += 1
        end
    end
end

# Движение вдоль левой границы
gobok(r)

# Построение периметра
buildp(r)
