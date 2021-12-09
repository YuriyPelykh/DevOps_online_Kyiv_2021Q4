
# Tsk 5..  The password field can be empty, indicating that no password is required to register a user. It can also contain not more than 13 characters of the encrypted version of the password.

In this task:  
 1. Analyze the structure of the **/etc/passwd** and **/etc/group** file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?![Screen1](./task_images/Screenshot_1.png)  
 File **/etc/passwd** contains lines of the following form, separated by colons, each defines a linux user:    
 >
 > ypelykh:x:1000:1000:Yurii Pelykh,6,0971530480,:/home/ypelykh:/bin/bash
 >

 Here:  
 **_ypelykh_** - username - must not contain a colon character (:), it is not recommended to use a period (.) in a name, or start it with "+";  
 **_x_** - means password, but really password hash is stored in file **/etc/shadow**. The password field can be empty, indicating that no password is required to register a user. It can also contain not more than 13 characters of the encrypted version of the password;  
 **_1000_** - uid - unique identifier of the user within the system;  
 **_1000_** - gid - unique identifier of the group within the system, which the user belongs to;  
 **_Yurii Pelykh,6,0971530480_** - uid comments - comment, extended user description, for example, full name, office, phone;  
 **_/home/ypelykh_** - user's home directory;  
 **_/bin/bash_** - program name the user's command interpreter.  

 2. What are the uid ranges? What is UID? How to define it?
 **UID** is a simple numeric designation for an individual user. This is usually a positive number not more than 65535 (sometimes 32 bit). Some identifiers are reserved for special use. UID-ranges are following:  
 - 0 - root user,
 - 1-999 - daemons, pseudo users, system and reserved users,
 - 1000-.. - regular users.


 3) What is GID? How to define it?
 4) How to determine belonging of user to the specific group?
 5) What are the commands for adding a user to the system? What are the basic
 parameters required to create a user?
 6) How do I change the name (account name) of an existing user?
 7) What is skell_dir? What is its structure?
 8) How to remove a user from the system (including his mailbox)?
 9) What commands and keys should be used to lock and unlock a user account?
 10) How to remove a user's password and provide him with a password-free
 login for subsequent password change?
 11) Display the extended format of information about the directory, tell about
 the information columns displayed on the terminal.
 12) What access rights exist and for whom (i. e., describe the main roles)?
 Briefly describe the acronym for access rights.
 13) What is the sequence of defining the relationship between the file and the
 user?
 14) What commands are used to change the owner of a file (directory), as well
 as the mode of access to the file? Give examples, demonstrate on the terminal.
 15) What is an example of octal representation of access rights? Describe the
 umask command.
 16) Give definitions of sticky bits and mechanism of identifier substitution. Give
 an example of files and directories with these attributes.
 17) What file attributes should be present in the command script?
