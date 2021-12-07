# Task 5.1  

The basics of Linux were learned, namely:  
## Part 1  
 1. Logging in to the system as root.  
 2. Changing the password and examination the basic parameters of the command **passwd**:  
 ![Screen1](./task_images/Screenshot_1.png)  
 When changing a user's password it's hash saves to the system file /etc/shadow:  
 ![Screen2](./task_images/Screenshot_2.png)  
 3. Determination of the users registrations in the system, as well as what commands they execute with commands **who** and **w**:  
 ![Screen3](./task_images/Screenshot_3.png)  
 An additional information can be gleaned from the above command execution:
   - FROM - an IP-address, which user is connected from.
   - TTY - users are logged on through terminal.
   - IDLE - user has been idle for a specific amount of time.
   - JCPU - is the time used by all processes attached to the tty. It does not include past background jobs, it does include  currently running background jobs.
   - PCPU - is the time used by the current process, named in the "what" field.
 4. Changing personal information:  
 ![Screen4](./task_images/Screenshot_4.png)  
 5. Got aquainted with the Linux help system, **man** and **info** commands. Got help on the previously discussed commands:  
 ![Screen5](./task_images/Screenshot_5.png)  
 Definition and description of any two keys for these commands:  
   - w: **-s**, --short - Using of the short format.  Don't print the login time, JCPU or PCPU times.  
   - w: **-h**, --no-header - Don't print the header.  
 6. Exploration of the **more** and **less** commands using the help system. View the contents of files .bash* using commands:  
 ![Screen6](./task_images/Screenshot_6.png)  
 7. *Description in plans that you are working on laboratory work 1. (Tip: You should read the documentation for the finger command):  
 ![Screen7](./task_images/Screenshot_7.png)  
 8. Listing the contents of the home directory using the **ls** command, definition its files and directories. (Hint: Use the help system to familiarize yourself with the ls command):  
 ![Screen8](./task_images/Screenshot_8.png)  

## Part 2  

 1. Examination of the **tree** command. Testing of applying a template, for example, display all files that contain a character "c", or files that contain a specific sequence of characters. List subdirectories of the root directory up to and including the second nesting level.  
 ![Screen9](./task_images/Screenshot_9.png)  
 2. Command **file** can be used to determine the type of file (for example, text or binary):  
 ![Screen10](./task_images/Screenshot_10.png)  
 3. Improving the skills of navigating the file system using relative and absolute paths. Using symbol '~' we can go back to home directory from anywhere in the filesystem:  
 ![Screen11](./task_images/Screenshot_11.png)  
 4. Consolidation of knowledges about various options for the **ls** command. Examples of listing directories using different keys are below:  
 ![Screen12](./task_images/Screenshot_12.png)  
 Using the switches:  
 **-l** - for list presentation of directory content;  
 **-a** - displays all content of a directory including hidden files and current and parent directories (. and ..);  
 **-h** - human readable file sizes.  
 5. Performed the following sequence of operations:  
   - creation of a subdirectory in the home directory:  
   ![Screen13](./task_images/Screenshot_13.png)  
   - in created subdirectory created a file containing information about directories located in the root directory (using I/O redirection operations):  
   ![Screen14](./task_images/Screenshot_14.png)  
   - copy the created file to home directory using relative and absolute addressing:  
   ![Screen15](./task_images/Screenshot_15.png)  
   - delete the previously created subdirectory with the file requesting removal;  
   - delete the file copied to the home directory:  
   ![Screen16](./task_images/Screenshot_16.png)  
 6. Performing the following sequence of operations:  
   - create a subdirectory test in the home directory;  
   - copy the .bash_history file to this directory while changing its name to labwork2:  
   ![Screen17](./task_images/Screenshot_17.png)  
   - create a hard and soft link to the labwork2 file in the test subdirectory:  
   ![Screen18](./task_images/Screenshot_18.png)  
   **Soft (symbolic) link** - pointer to a file via its path specification, like a link in Windows.  
   **Hard link** - pointer to a file's identification number in filesystem (inode).  
   - change the data by opening a symbolic link. What changes will happen and why?  
   ![Screen19](./task_images/Screenshot_19.png)  
   If an original file has been modified, a date of modification of it's hard link also modifies, but modification date of symbolic link stays without changes, because hard link is just a pointer to the original file's inode and displays a properties of recently modified original file.  
   - rename the hard link file to hard_lnk_labwork2;  
   - rename the soft link file to symb_lnk_labwork2 file;  
   - then delete the labwork2. What changes have occurred and why?  
   ![Screen20](./task_images/Screenshot_20.png)  
   If the original file is deleted, the symbolic link is not removed, but is useless. Hard link still work and original file still be accessible, it is keeping in system till at least one hard link points to it.  
 7. Using the locate utility, find all files that contain the "squid" and "traceroute" sequence:  
 ![Screen21](./task_images/Screenshot_21.png)  
 8. Determination which partitions are mounted in the system, as well as the types of these partitions:  
 ![Screen22](./task_images/Screenshot_22.png)  
 9. Count the number of lines containing a given sequence of characters in a given file:  
 ![Screen23](./task_images/Screenshot_23.png)  
 10. Using the find command, find all files in the /etc directory containing the "host" character sequence:  
 ![Screen24](./task_images/Screenshot_24.png)  
 11. List all objects in /etc that contain the "ss" character sequence. How can I duplicate a similar command using a bunch of grep?  
   - Looking in object names:  
   ![Screen25](./task_images/Screenshot_25.png)  
   - Looking in files content:  
   ![Screen27](./task_images/Screenshot_27.png)  
   ![Screen28](./task_images/Screenshot_28.png)  
 12. Organize a screen-by-screen print of the contents of the /etc directory. Hint: You must use stream redirection operations:  
 ![Screen29](./task_images/Screenshot_29.png)  
 13. Types of devices:  
 **Character Device**  
 These devices transfer data, but one a character at a time. You'll see a lot of pseudo devices (/dev/null) as character devices, these devices aren't really physically connected to the machine, but they allow the operating system greater functionality.  
 **Block Device**  
 These devices transfer data, but in large fixed-sized blocks. You'll most commonly see devices that utilize data blocks as block devices, such as hard drives, filesystems, etc.  
 **Pipe Device**  
 Named pipes (also First In First Out (FIFO) buffers) allow two or more processes to communicate with each other, these are similar to character devices, but instead of having output sent to a device, it's sent to another process.  
 **Socket Device**  
 Socket devices facilitate communication between processes, similar to pipe devices but they can communicate with many processes at once.  
 **How to determine the type of device?**  
 In the ls command we can see the type of file with the first bit on each line. Device files are denoted as the following:  
   - c - character
   - b - block
   - p - pipe
   - s - socket
 ![Screen30](./task_images/Screenshot_30.png)  
 14. How to determine the type of file in the system, what types of files are there?
 ![Screen31](./task_images/Screenshot_31.png)  
 Types of files:  
   - – : regular file  
   - d : directory  
   - c : character device file  
   - b : block device file  
   - s : local socket file  
   - p : named pipe  
   - l : symbolic link  
 15. *List the first 5 directory files that were recently accessed in the /etc directory:  
 ![Screen32](./task_images/Screenshot_32.png)  
 ![Screen33](./task_images/Screenshot_33.png)  
