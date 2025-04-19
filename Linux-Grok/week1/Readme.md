# Mini-Project 1: Directory Organizer
Write a script (organize.sh) that:
- Creates directories text_files and scripts in /home/user/linux_learning/week1.
- Moves all .txt files to text_files and .sh files to scripts using mv.
- Prints “Organization complete!” when done.
- Run it and verify the files moved correctly.


# Mini-Project 2: System Info Reporter
- Create a script (sysinfo.sh) that:
- Displays disk usage (df -h | grep /dev/), memory usage (free -m), and uptime (uptime).
- Saves the output to a file (/home/user/linux_learning/week1/sysinfo.log).
- Use redirection (> or >>) to save the data.


# Mini-Project 3: Permission Checker
- Write a script (perm_check.sh) that:
- Takes a directory as input (e.g., ./perm_check.sh /home/user/linux_learning/week1/docs).
- Lists permissions of all files inside (ls -l) and checks if any are world-writable (rwxrwxrwx).
- Prints a warning if found (use if with grep).