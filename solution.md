# Task 1: User and Group Management
1. Create users

```
useradd user1
useradd user2
useradd user3

```
Set password for users
```
passwd user1
passwd user2
passwd user3
```
**Note**: You can generate random passwords for users from use /dev/urandom, mkpasswd and pwgen.

2. Create groups

```
groupadd devops
groupadd aws

```

3. Change primary groups

```
usermod -g devops user2
usermod -g devops user3

```

4. Add Secondary group
```
usermod -a -G aws user1

```
5. Create File and Directory Structure:

```
mkdir -p home dir1 dir2/dir1/dir2/dir10  dir3/dir11 dir4/dir12 dir5/dir13 dir6 dir7/dir10 dir8/dir9 opt/dir14/dir10

touch dir1/f1 dir2/dir1/dir2/f3 dir4/dir12/f5&&f4  dir7/f3  f1 f2 opt/dir14/f3
```

6. Change Group Ownership:
```
chgrp devops /dir1 /dir7/dir10 /dir7/dir10/f2

```

7. Change ownership 
```
chown user1 /dir1 /dir7/dir10 /dir7/dir10/f2

```


# Task 2: User and Group Management by user1
1. Switch to `user1`:

```
su - user1

```

2. Create users
```

sudo useradd user4
sudo useradd user5

```
Set passwords
```
passwd user4
passwd user5

```
3. Create groups
```
groupadd app
groupadd database

```

