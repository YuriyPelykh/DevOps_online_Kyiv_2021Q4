
# Tsk 5.2

 1. Analyze the structure of the **/etc/passwd** and **/etc/group** file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?  
 ![Screen1](./task_images/Screenshot_1.png)  
 File **/etc/passwd** contains lines of the following form, separated by colons, each defines a linux user:  

 >
 > ypelykh:x:1000:1000:Yurii Pelykh,6,0971530480,:/home/ypelykh:/bin/bash
 >

  Here:  
  **_ypelykh_** - username - must not contain a colon character (:), it is not recommended to use a period (.) in a name, or start it with "+";  
  **_x_** - means password, but really password hash is stored in file **/etc/shadow**. The password field can be empty, indicating that no password is required to register a user. It can also contain not more than 13 characters of the encrypted version of the password;  
  **_1000_** - UID - unique identifier of the user within the system;  
  **_1000_** - GID - unique identifier of the group within the system, which the user belongs to;  
  **_Yurii Pelykh,6,0971530480_** - UID comments - comment, extended user description, for example, full name, office, phone;  
  **_/home/ypelykh_** - user's home directory;  
  **_/bin/bash_** - program name the user's command interpreter.  

  Types of users:  
  - **Root** - root user;
  - **Regular users** - like _ypelykh_;
  - **Pseudo-users** - are not registered in the system and are only needed to confirm ownership of the processes. Their descriptions are never edited. Examples: _sshd_, _tcpdump_, _proxy_.  

  File **/etc/group** contains lines of existing user groups in system:  
  ![Screen2](./task_images/Screenshot_2.png)  

  The format for line in this file is:  
  >
  > adm:x:4:syslog,ypelykh
  >

  Here:  
  **_adm_** - group name - contains the text name for the group.  
  **_x_** - password - contains the encrypted password of this group (really password is stored in file **/etc/shadow**).  
  **_4_** - group ID - contains a unique identifier for this group.  
  **_syslog,ypelykh_** - list field, which contains a comma separated list of users belonging to this group.  

  Users do not need to be included in the list of those groups that are specified as their primary in the /etc/passwd file.  

  2. What are the UID ranges? What is UID? How to define it?
  **UID** is a simple numeric designation for an individual user. This is usually a positive number not more than 65535. Some identifiers are reserved for special use. UID-ranges are following:  
  - 0 - root user,
  - 1-999 - daemons, pseudo users, system and reserved users,
  - 1000-.. - regular users.

  3. What is GID? How to define it?  
  GID - Group ID - unique identifier of the group within the system, which the user belongs to. GID can be defined from file **/etc/passwd** or **/etc/group**.  

  4. How to determine belonging of user to the specific group?  
  With **groups** command:  
  ![Screen3](./task_images/Screenshot_3.png)  
  5. What are the commands for adding a user to the system? What are the basic parameters required to create a user?  
  Command **adduser** can be used to create a user in the system. User's name is required parameter to create a new user. **adduser** utiliy also asks a password for new user. Thit is sufficient parameters for user creation procedure, but additional parameters may be also specified, for example a group, which user must belongs to, user's home directory, user's command interpreter.  
  ![Screen4](./task_images/Screenshot_4.png)  
  6. How do I change the name (account name) of an existing user?  
  
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
