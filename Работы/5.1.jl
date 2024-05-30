using HorizonSideRobots

# Создание робота с загрузкой карты из файла "map.sit" с включенной анимацией
r = Robot("map.sit", animate=true)

# Функция для построения границы
function gobok(r::Robot)
    hz = 3  # Начальное направление - влево
    while !(isborder(r, HorizonSide(2)) && hz == 2)  # HorizonSide(2) соответствует движению вниз
        if !isborder(r, HorizonSide(hz))
            putmarker!(r)  # Поставить маркер
            move!(r, HorizonSide(hz))  # Двигаться в направлении hz
        elseif hz == 3
            hz = 0
        elseif hz == 0
            hz = 1
        elseif hz == 1
            hz = 2
        end
    end
end

# Функция для поиска пути
function searchp(r::Robot)
    count = 0
    hz = 0  # Начальное направление - вправо
    while true
        if !isborder(r, HorizonSide(hz))
            move!(r, HorizonSide(hz))
            count += 1
        elseif count == 14
            count = 0
            move!(r, HorizonSide(3))  # Двигаться влево
            if hz == 0
                hz = 2
            else
                hz = 0
            end
        else
            break
        end
    end
end

# Функция для рисования следующей границы
function paintnextborder(r::Robot)
    hz = 1  # Начальное направление - вправо
    hzup = 0  # Направление для подъема
    while true
        if isborder(r, HorizonSide(0))  # Вверх
            hzup = 0
            putmarker!(r)
            move!(r, HorizonSide(3))  # Двигаться влево
        elseif isborder(r, HorizonSide(3))  # Влево
            hzup = 3
            putmarker!(r)
            move!(r, HorizonSide(2))  # Двигаться вниз
        elseif isborder(r, HorizonSide(2))  # Вниз
            hzup = 2
            putmarker!(r)
            move!(r, HorizonSide(1))  # Двигаться вправо
        elseif isborder(r, HorizonSide(1))  # Вправо
            hzup = 1
            putmarker!(r)
            move!(r, HorizonSide(0))  # Двигаться вверх
        end
        if !isborder(r, HorizonSide(0)) && !isborder(r, HorizonSide(1)) && !isborder(r, HorizonSide(2)) && !isborder(r, HorizonSide(3))
            putmarker!(r)
            move!(r, HorizonSide(hzup))
        end
    end
end

# Запуск функций
gobok(r)
searchp(r)
paintnextborder(r)