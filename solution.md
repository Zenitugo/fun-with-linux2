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
5. 