using HorizonSideRobots

# Создание робота в позиции (15, 15) с включенной анимацией
r = Robot(15, 15, animate=true)

# Функция для размещения маркеров по периметру
function perimetr_markers(r::Robot)
    for side in (HorizonSide(i) for i=[3, 0, 1, 2])
        while !isborder(r, side)
            move!(r, side)
        end
        putmarker!(r)
    end
end

# Запуск функции для размещения маркеров
perimetr_markers(r)