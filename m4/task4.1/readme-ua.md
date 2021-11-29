# Завдання 4.1

## Частина 1
 Під час виконання завдання було закріплено основи адміністрування БД, а саме:  
  - Встановлення MySQL server.  
  - Опис схеми БД. В якості тестової змодельовано наступну структуру БД:  
  ![Screen0](./task_images/DB_schema.png)  
  - Створення таблиць БД через консоль:  
  ![Screen1](./task_images/Screenshot_1.png)  
  - Наповнення таблиць командою INSERT:  
  ![Screen2](./task_images/Screenshot_2.png)  
  - Виконання запитів до БД за допомогою оператора SELECT та WHERE, GROUP BY і ORDER BY:  
  ![Screen3](./task_images/Screenshot_3.png)  
  - Створення нових користувачів бази даних, призначення їм прав:  
  ![Screen4](./task_images/Screenshot_4.png)  
  ![Screen5](./task_images/Screenshot_5.png)  

## Частина 2
 - Виконання експорту (бекапу) та імпорту (відновлення) БД:  
 ![Screen6](./task_images/Screenshot_6.png)  
 ![Screen7](./task_images/Screenshot_7.png)  
 - Створення БД MySQL на AWS RDS:  
 ![Screen8](./task_images/Screenshot_8.png)  
 - Перенесення локальної БД на AWS RDS:  
 ![Screen9](./task_images/Screenshot_9.png)  
 - Виконання запитів до БД через CLI:  
 ![Screen10](./task_images/Screenshot_10.png)  
 - Створення дампу БД засобами AWS RDS та Workbench:  
 ![Screen11](./task_images/Screenshot_11.png)  
 ![Screen12](./task_images/Screenshot_12.png)  

## Частина 3

aws dynamodb put-item --table-name clients --item '{"client_name": {"S": "Petro Ivanenko"}, "phone_number": {"S": "0732003305"}, "address": {"S": "Berdychiv"}}' --return-consumed-capacity TOTAL
