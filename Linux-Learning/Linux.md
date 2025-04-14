# Understanding Bash Scripting

## Functions
 **Functions Definition**

- What it does: Groups commands together as a reusable unit

- Why important: Makes code modular and easier to maintain

 - Future use: Use functions for any task you might repeat

 ```
    check_cpu() {
    # code here
}

 ```

**Calling Functions**

- What it does: Runs the function and stores its output

- Why important: Lets you reuse code without duplication

- Future use: Call functions whenever you need their functionality

```
    local cpu=$(check_cpu)

```

## System Monitoring Commands
**CPU Monitoring**

```

    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'

```
Commands used:

- top: Shows system processes

- grep: Finds lines containing "Cpu(s)"

- sed: Extracts the idle percentage

- awk: Calculates used CPU (100 - idle)

Why important: Shows how to combine commands for specific data

Future use: Pipe commands together to extract precise information

**Memory Monitoring**
```
    free -m | awk '/Mem:/ {print $2}'
```

Commands used:

- free: Shows memory usage

- awk: Extracts specific columns

Why important: Demonstrates simple memory checking

Future use: Use free for basic memory stats


**Disk MOnitoring**
```
    df -h / | awk '/\// {print $5}' | tr -d '%'
```
Commands used:

- df: Shows disk usage

- tr: Removes the % character

Why important: Simple disk space checking

Future use: df -h is your go-to for disk space

## Variable Assignment
- What it does: Stores command output in a variable

- Why important: Lets you reuse values

- Future use: Store any data you need to reference later

```
local cpu_usage=$(command)
local var_name
```