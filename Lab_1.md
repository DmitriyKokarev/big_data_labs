Лабораторная работа №1. Кокарев Д.В. РИМ-201211

ЗАДАНИЕ 1.

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

Теперь поработаем с хешами.
Синтаксис создания хэша: hmset <hash_name> <key_1> <value_1> <key_2> <value_2> ...

Зададим следующий хэш:

![image](https://user-images.githubusercontent.com/95758544/145409569-b66bb67b-8956-4fae-baf8-b1d5f60634a1.png)

Длаее можем посмотреть какие ключи в хэше и значения ключей:

![image](https://user-images.githubusercontent.com/95758544/145409783-ff6ef550-d139-4326-bc37-6a3f3808e14c.png)

![image](https://user-images.githubusercontent.com/95758544/145409824-e3a2d0bf-42ca-4bd7-aa43-77844e51d325.png)

Далее поработаем с множестваим и их объединениями:

Создадим хэши rasp, mail и rtf

![image](https://user-images.githubusercontent.com/95758544/145426263-cad1de75-9160-4db1-90ef-4bae03e0e454.png)

Объединим хэши в два множества: priv и urfu

![image](https://user-images.githubusercontent.com/95758544/145426514-fb1fc5a1-3818-4799-a045-fd0215a4c25c.png)

Найдем объединение множеств:

![image](https://user-images.githubusercontent.com/95758544/145426612-1636ec90-a572-4a09-b4ed-d3756ca1fefc.png)


ЗАДАНИЕ 2.

1. Выполнить скрипт:

![image](https://user-images.githubusercontent.com/95758544/145439456-2b3ea5e3-0fcb-4e01-93ba-5d360b673f65.png)

![image](https://user-images.githubusercontent.com/95758544/145439529-f543e7c2-db71-464b-afa2-cbc14c45d1f5.png)

Результат выполнения в файле result_script_1.txt

2. Напишите скрипт для установки 1М простых ключей, для 10м простых ключей.

Для 1м ключей ушло 1.46 - 1.44 gb
Время 2,451 сек

Для 10м ключей ушло 3.48 - 2.26 gb
Время 29,421 сек

3. Напишите скрипт для установки 1М хэшей, 10М хэшей.
Для 1м ключей ушло 1.76 - 1.55 gb
Время 5.338 сек

Для 10м ключей ушло 4.34 - 1.55 gb
Время 76.018 сек


