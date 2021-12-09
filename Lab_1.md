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
![image](https://user-images.githubusercontent.com/95758544/145405822-ef7daf4c-e83c-4598-9795-c0c88ab9ccee.png)

Создадим новый ключ, значение которого будет ссылкой на сайт: https://urfu.ru/ru/
![image](https://user-images.githubusercontent.com/95758544/145406255-5b3fdd9f-ba6b-46e3-8c96-42dc85670496.png)

И командой expire установим время жизни ключа, равное 20-ти секундам:
![image](https://user-images.githubusercontent.com/95758544/145406547-496ff908-2f8f-4c69-9306-faf030ba6307.png)

Затем, при помощи команды ttl, можно узнать время жизни ключа:
![image](https://user-images.githubusercontent.com/95758544/145406638-73b62fbd-afce-4f7e-b8d9-1ffa347c4192.png)

После того, как прошли 20 секунд, попробуем получить узнать еще раз вермя жищзни ключа
![image](https://user-images.githubusercontent.com/95758544/145406753-f049b06f-66e4-442a-99ae-7ca5f558b8bf.png)

Тепер попробуем получить сам ключ:
![image](https://user-images.githubusercontent.com/95758544/145406829-8ac0ba61-7ec7-4a86-8bb5-01bdb09b580a.png)

Отсюда можно сделать промежуточный вывод, что при истечении времени жизни ключа, если отправить повторный запрос на вермя жизни ключа, то получим значение -2.
Если попробуем запросить время жизни ключа, при этом создать пару ключ-значение и не задавать время жизни для неё:

![image](https://user-images.githubusercontent.com/95758544/145407108-a3ab8522-27e5-428c-80f5-bb38a7a6d8d4.png)

Получим значение -1.




