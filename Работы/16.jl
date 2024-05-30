using HorizonSideRobots

# Функция для поиска маркера на поле
function find_marker!(r::Robot)
    # Функция-предикат, которая проверяет, находится ли робот на клетке с маркером
    tmp = (side::HorizonSide) -> ismarker(r)
    # Вызываем функцию spiral!, передавая ей функцию-предикат и робота
    spiral!(tmp, r)
end

# Функция для движения робота по спирали (необходимо определить)
function spiral!(condition::Function, r::Robot)
    # Здесь должен быть код для перемещения робота по спирали, пока условие condition истинно
end