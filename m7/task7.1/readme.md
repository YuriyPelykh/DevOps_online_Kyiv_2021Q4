# Task 7.1  Linux administration with bash

### A. Create a script that uses the following keys:  
1. When starting without parameters, it will display a list of possible keys and their description.  
![Screen1](./task_images/Screenshot_1.png)  
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet.  
![Screen2](./task_images/Screenshot_2.png)  
3. The --target key displays a list of open system TCP ports.  
The code that performs the functionality of each of the subtasks must be placed in a separate function.  
![Screen3](./task_images/Screenshot_3.png)  

### B. Using Apache log example create a script to answer the following questions:  
1. From which ip were the most requests?  
2. What is the most requested page?  
3. How many requests were there from each ip?  
4. What non-existent pages were clients referred to?  
5. What time did site get the most requests?  
6. What search bots have accessed the site? (UA + IP)  

### C. Create a data backup script that takes the following data as parameters:  
1. Path to the syncing directory.  
2. The path to the directory where the copies of the files will be stored.  
In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute].  

Used sources:  
1. https://coderoad.ru/43876891/%D0%A3%D1%87%D0%B8%D1%82%D1%8B%D0%B2%D0%B0%D1%8F-%D0%B0%D0%B4%D1%80%D0%B5%D1%81-IP-%D0%B8-%D1%81%D0%B5%D1%82%D0%B5%D0%B2%D1%83%D1%8E-%D0%9C%D0%B0%D1%81%D0%BA%D1%83-%D0%9A%D0%B0%D0%BA-%D1%8F-%D0%BC%D0%BE%D0%B3%D1%83-%D0%B2%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C-%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD-%D0%BF%D0%BE%D0%B4%D1%81%D0%B5%D1%82%D0%B8-%D1%81  
2.
