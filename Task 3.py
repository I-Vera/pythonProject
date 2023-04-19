# Написать функцию, принимающую на вход строку, в которой может встречаться (текст в круглых скобках).
# Функция должна возвращать исходную строку, из которой удалён весь текст в круглых скобках, включая сами скобки.
# Исходить из того, что каждая открывающая скобка всегда имеет закрывающую, т.е. проверку на непарные скобки делать не нужно.

txt = input('Ваш текст, сэр: ')
i = 0
while i in range(len(txt)):
    if txt[i] == '(':
        first = i
        i+=1
    elif txt[i] == ')':
        last = i+2
        txt = txt[0:first]+txt[(last):len(txt)]
        first = 0
        last = 0
        i += 1
    else: i+=1
print('Измененный текст, сэр:')
print(txt)