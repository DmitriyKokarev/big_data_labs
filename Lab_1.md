Лабораторная работа №1. Кокарев Д.В. РИМ-201211

1. Установка redis
  $ sudo apt-get update

Запустим redis:
  $ redis-server

Проверим статус:
$ service redis-server status
![image](https://user-images.githubusercontent.com/95758544/145271117-86dd5482-67fb-475b-a586-e38cae6f3516.png)

2. Попробовать команды из презентации:

$ redis-cli
Тем самым подключились к серверу и можем исполнять следующие команды
    ![image](https://user-images.githubusercontent.com/95758544/145271484-0b4a6908-eb01-4144-8cc2-1248d9dab10b.png)

$ config get *
![image](https://user-images.githubusercontent.com/95758544/145271966-c8c4e8c7-7f3b-4960-9ecb-645532558089.png)

Создадим ключ "users:msg" и поместим в него значение: "{name: Segrey, likes: [redis]}"
![image](https://user-images.githubusercontent.com/95758544/145403992-d3d0e6f3-2f43-4cb4-b7f1-a5167d301725.png)

Для получения значения из ключа, используем команду 'get': 
![Uploading image.png…]()
