using HorizonSideRobots

function mark_all_cells(r::Robot)
    # Сохраняем исходное положение робота
    initial_position = get_position(r)
    
    # Маркируем текущую клетку
    putmarker!(r)
    
    # Поворачиваем робота налево и двигаемся, если это возможно
    for side in (Nord, West, Sud, Ost)
        while true
            if !isborder(r, side)
                move!(r, side)
                putmarker!(r)
            else
                break
            end
        end
        # Возвращаемся назад до границы
        while ismarker(r)
            move!(r, inverse_side(side))
        end
    end
    
    # Возвращаемся в исходное положение
    go_to_initial_position(r, initial_position)
end

function get_position(r::Robot)
    # Функция для получения текущей позиции робота
    # Должна быть реализована в модуле HorizonSideRobots
end

function inverse_side(side::HorizonSide)
    # Функция для получения противоположного направления
    # Должна быть реализована в модуле HorizonSideRobots
end

function go_to_initial_position(r::Robot, initial_position)
    # Функция для возвращения робота в исходное положение
    # Должна быть реализована в модуле HorizonSideRobots
end

# Создание робота в произвольной клетке на поле
r = Robot(animate=true)

# Вызов функции для маркировки всех клеток
mark_all_cells(r)
