# Mastering awk, grep, and sed - The Linux Text Processing Power Trio
These three commands are essential for text processing in Linux

## grep - The Path Finder
This command searches for text pattern in files or input

**Basic Usage**

```
    grep "pattern" filename

```

**Common Flags:**
-i: Case insensitive search

-v: Invert match (show lines NOT containing pattern)

-r: Recursive search in directories

-n: Show line numbers

-c: Count of matching lines

**Examples**

```
    grep "Cpu(s)"  # Finds lines containing "Cpu(s)"
    grep "Mem:"    # Finds memory information lines

```

**Exercise**
1. Find all users in /etc/passwd
```
    grep "/bin/bash" /etc/passwd

```

2. Count how many times "error" appears in log
```
    grep -c "error" /var/log/syslog

```

3. Find all .conf files containing port
```
    grep -r "port" /etc/*.conf

```

## sed - The Stream Editor
This command performs text transformation on an input stream

**Basic Usage**
```
    sed 's/find/replace/' filename

```

**Common Flags:**
-i: Edit files in-place (be careful with this!)

-e: Add multiple expressions

-n: Suppress automatic printing


**Examples:**
```
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/"
    # This extracts the CPU idle percentage by:
    # 1. Matching everything up to the number we want
    # 2. Capturing the number with \( \)
    # 3. Replacing the whole line with just the number

```

1. Replace "foo" with "bar" in a file:
```
    sed 's/foo/bar/g' file.txt

```

2. Delete empty lines
```
    sed '/^$/d' file.txt

```

3. Print specific lines(lines 5-10)
```
    sed -n '5,10p' file.txt
```

##  awk - The Data Extraction Tool
This command process and structured text data

**Basic Usage**
```
    awk '/pattern/ {action}' filename

```

**Special Variables:**
- $0: Whole line

- $1, $2, etc.: First, second column, etc.

- NF: Number of fields

- NR: Current record (line) number

**Examples**

```
    awk '/Mem:/ {print $2}'  # Prints 2nd column of line containing "Mem:"
    awk '{print 100 - $1}'   # Performs math operation on first column
    awk '/\// {print $5}'    # Prints 5th column for lines containing "/"

```

1. Prinf first column of a csv
```
    awk -F',' '{print $1}' data.csv

```

2. Sum numbers in second column
```
    awk '{sum+=$2} END {print sum}' file.txt

```

3. Filter lines where column 3 > 100:
```
    awk '$3 > 100' data.txt

```
