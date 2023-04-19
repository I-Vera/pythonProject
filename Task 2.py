# Написать функцию, которая принимает на вход список чисел любой ненулевой длины и возвращает отсортированный по возрастанию список.
# Встроенными библиотеками пользоваться нельзя, встроенной функцией sort() - тоже.

N = int(input('Я отсортирую ваш список чисел! Но перед этим, введите, пожалуйста, длину вашего списка: '))
list = []
for i in range(N):
    num = int(input("Введите ваше число: "))
    if (i == 0) or (num > list[-1]):
        list.append(num)
    else:
        position = 0
        while position < len(list):
            if num <= list[position]:
                list.insert(position, num)
                break
            position += 1
print(list)