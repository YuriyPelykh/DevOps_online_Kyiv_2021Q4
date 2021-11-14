# Завдання 2.2  
 Було вивчено базові теоретичні основи та здобуто практичний досвід роботи з хмарними сервісами AWS, а саме:  
  - Створення віртуального приватного сервера (VPS) з Amazon Lightsail, можливості віддаленого підключення до нього через:  
    - Web-термінал:  
    ![Screen1](./task_images/Screenshot_1.png)  
    - SSH-клієнт:
    ![Screen2](./task_images/Screenshot_2.png)  
  - Розгортання серверів через AWS Management Console на основі інстансів (instance) Amazon Elastic Compute Cloud (EC2):
  ![Screen3](./task_images/Screenshot_3.png)  
  ![Screen4](./task_images/Screenshot_4.png)  

  > В якості операційної системи було обрано Ubuntu Server 20.04 замість рекомендованої CentOS, так як остання не надається для безкоштовного використання в рамках Amazon Free Tier.  

  - Збереження стану ВМ у вигляді знімків (snapshots):  
  ![Screen5](./task_images/Screenshot_5.png)  
  - Створення інстансів збереження даних Elastic Block Store (EBS), їх приєднання до існуючих EC2 та виконання необхідних налаштувань всередині ОС ВМ з метою зробити доданий EBS доступним для збереження даних:  
  ![Screen6](./task_images/Screenshot_6.png)  
  ![Screen7](./task_images/Screenshot_7.png)  
  - Розгортання інстансу із бекапу. Для цього:  
    - із розділу Snapshots було створено образ (image) на основі раніше зробленого знімка стану ВМ:  
    ![Screen8](./task_images/Screenshot_8.png)  
    - запущено новий інстанс EC2 зі створеного образу:  
    ![Screen9](./task_images/Screenshot_9.png)  
    ![Screen10](./task_images/Screenshot_10.png)  
  - Перенесення раніше створеного диска EBS із першої ВМ на другу:  
  ![Screen11](./task_images/Screenshot_11.png)  
  ![Screen12](./task_images/Screenshot_12.png)  
  - Створення і конфігурування інстансу WordPress, використовуючи Amazon Lightsail, налаштування статичної IP-адреси, DNS:  
  ![Screen13](./task_images/Screenshot_13.png)  
  ![Screen14](./task_images/Screenshot_14.png)  
  - Створення інстансу Simple Storage Service (S3):  
    - Завантаження файлів до/із bucket через web-інтерфейс сервісу S3.  
    - Створення облікового запису AWS Identity and Access Management (IAM).  
    - Встановлення та конфігурування CLI AWS.  
    - Завантаження файлів до/із bucket через AWS CLI:  
    ![Screen15](./task_images/Screenshot_15.png)  
  - Досліджено можливості створення власного домену і доменного імені за допомогою AWS-сервісу Route53.
