# Написать функцию, принимающую число от 0 до 1000, определяющую, является ли это число простым и возвращающую True, если да, False если нет.
# Использовать эту функцию в программе, которая просит пользователя ввести число с клавиатуры и выводит в консоль результат.
# Встроенными библиотеками пользоваться нельзя.

def prime_id(x):
    if x == 1:
        print(f'Сэр, {x} не является простым числом >:[')
    elif x > 1000:
        print(f'Сэр, {x} - слишком большое число для моего маленького процессора <:[')
    elif x > 1:
        for i in range(2, int(x)):
            if (x % i) != 0:
                d = True
            else:
                d = False
                break
        print(d)

num = int(input("Ваше число от 1000, сэр: "))
prime_id(num)