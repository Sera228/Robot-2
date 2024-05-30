using HorizonSideRobots

# Создание робота в позиции (15, 15) с включенной анимацией
r = Robot(15, 15, animate=true)

# Функция для построения лесенки в виде крестика
function build_lesenka(r::Robot)
    # Первая часть лесенки - вправо и вверх
    while !isborder(r, HorizonSide(3))  # HorizonSide(3) соответствует движению влево
        putmarker!(r)  # Поставить маркер
        move!(r, HorizonSide(3))  # Двигаться влево
        move!(r, HorizonSide(0))  # Двигаться вправо
    end
    putmarker!(r)  # Поставить последний маркер

    # Вторая часть лесенки - вниз
    while !isborder(r, HorizonSide(2))  # HorizonSide(2) соответствует движению вниз
        move!(r, HorizonSide(2))  # Двигаться вниз
    end
    putmarker!(r)  # Поставить последний маркер

    # Третья часть лесенки - влево и вверх
    while !isborder(r, HorizonSide(1))  # HorizonSide(1) соответствует движению вверх
        move!(r, HorizonSide(1))  # Двигаться вверх
        move!(r, HorizonSide(0))  # Двигаться вправо
        putmarker!(r)  # Поставить маркер
    end
end

# Запуск функции для построения лесенки
build_lesenka(r)