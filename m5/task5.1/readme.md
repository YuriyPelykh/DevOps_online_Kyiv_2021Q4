# Task 5.1  

The basics of Linux were learned, namely:  
## Part 1  
 1. Logging in to the system as root.  
 2. Changing the password and examination the basic parameters of the command "passwd":  
 ![Screen1](./task_images/Screenshot_1.png)  
 When changing a user's password it's hash saves to the system file /etc/shadow:  
 ![Screen2](./task_images/Screenshot_2.png)  
 3. Determination od the users registrations in the system, as well as what commands they execute with commands "who" and "w":  
 ![Screen3](./task_images/Screenshot_3.png)  
 An additional information can be gleaned from the above command execution:
   - FROM - an IP-address, which user is connected from.
   - TTY - users are logged on through terminal.
   - IDLE - user has been idle for a specific amount of time.
   - JCPU - is the time used by all processes attached to the tty. It does not include past background jobs, it does include  currently running background jobs.
   - PCPU - is the time used by the current process, named in the "what" field.
 4. Changing personal information:  
 ![Screen4](./task_images/Screenshot_4.png)  
 5. Got aquainted with the Linux help system, "man" and "info" commands. Got help on the previously discussed commands:  
 ![Screen5](./task_images/Screenshot_5.png)  
 Definition and description of any two keys for these commands:  
   - w: -s, --short - Using of the short format.  Don't print the login time, JCPU or PCPU times.  
   - w: -h, --no-header - Don't print the header.  
 6. Exploration of the "more" and "less" commands using the help system. View the contents of files .bash* using commands:  
 ![Screen6](./task_images/Screenshot_6.png)  
 7. * Describe in plans that you are working on laboratory work 1. Tip: You should read the documentation for the finger command.
 8. * List the contents of the home directory using the ls command, define its files and directories. Hint: Use the help system to familiarize yourself with the ls command.

## Part 2  

 The basics of database administration were learned, namely:  
  - Installing MySQL server.  
  - Design of the database schema. The following database structure was modeled:  
  ![Screen0](./task_images/DB_schema.png)  
