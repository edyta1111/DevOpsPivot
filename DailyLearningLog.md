## 2025-10-18 SAT
- reviewed material from Self-Hosting Docker course (udemy.com/course/self-hosting-docker-linux) to prepare to host another app on my own
- attempting to deploy Time Tagger (https://github.com/almarklein/timetagger) --> deploy successful
- used Bcrypt from previously deployed IT Tools to hash a password - I'm finding them more and more useful
- figuring out where Docker/Portainer actually stores things on the system, but it seems more complex than anticipated, and I don't think I can grasp this just yet

## 2025-10-20 MON
- signed up for an extensive live course for DevOps - not necessarily because I can't learn myself, but to have an explicit reason why I can't go out or fool around (my boundary-setting skill is still under development T^T)
- for the course, I have to install CentOS, and after considering my options, available hardware, and convenience, I decided to have a virtual machine on a MacBook
- went through the hurdle of downloading VMware Fusion for Mac from the Broadcom website (the user experience was truly terrible)
- got an error worthy of a dummy I am: "This VM cannot be powered on because it requires x86 machine architecture, which is incompatible with this ARM machine architecture host" - redownloading a correct ISO
- CentOS installed in a VM through VMware Fusion and running correctly

## 2025-10-21 TUE
- going through various escape characters for the `echo` command. The most interesting one so far is \r - "carriage return". I didn't know there was a backspace \b either. Learned how to do math directly in terminal: `echo $((10 - 4))`
- the tutorial I bought is perfect: full of mistakes and it's making me double-check everything the tutor is talking about. This is exactly what I needed - believe no one, try and check yourself, lol.
- `id` output: user id, primary group, supplementary groups
- to check all groups, read /etc/groups

## 2025-10-23 THU | Mood 2/10 but it is what it is
- practiced `cp` and `mv` commands with various options. I found `mv -i` quite practical to prevent accidental overwrite, also `cp -n` to only copy without overwriting repeated files. Examined man pages. 

## 2025-10-24 FRI
- learned that the `touch` command will not overwrite a pre-existing file - it will only change the file's access and modification times, and this is its main function (not to create new files).
- practiced `mkdir`, `rmdir`, and `rm` commands. Again, flag `-i` is proving useful.

## 2025-10-25 SAT
-  went through the orientation call for a Geeks4Geeks DevOps course. I got up at 7:25 AM my time on Saturday to join, and I didn't have to force myself out of bed, even though I'm sleep deprived. It's exciting. The live course itself also looks really promising.
- reviewed head and tail commands for text stream processing

## 2025-10-26 SUN
- learned about `tac` command, which prints the content of the file just like the `cat` command, but bottom-up - last line first
- I need to switch to using `less` and `more` commands more often since they have added functionality. But I can also open everything in Vim

## 2025-10-27 MON
- played with the `cut` command. I understand now how we can define the delimiter with `-d` option and display only certain fields in certain positions of the text file (add `-f <num>`). Option `-w` by default defines delimiter as whitespaces (spaces and tabs) and can be an alternative to `-d " "`
- exercised various `grep` options and found a few cool ones, like `-A2 -B2` returns the search result and 2 lines before it and 2 lines after it. Probably my most used option will be `-i` since it makes the search case insensitive. I recognize that I need to learn regular expressions to use the full potential of `grep`.

## 2025-10-28 TUE
- Learned `sort` and `comm` commands and how to combine them. Discovered that it’s not possible to compare two `sort` outputs directly inline (e.g., `comm (sort ...) (sort ...)`) because `comm` expects files. The workaround is process substitution, which lets the shell treat command output as a file: `comm <(sort ...) <(sort ...)`. Neat.
- Noted that many commands use different option letters for similar things (e.g., the delimiter flag `-t ' '`), which can be confusing. I’ll need repetition to get used to it.
- Practiced `sed` and `tee` for text processing and combining them in pipelines, then using `comm` to compare results. Learned that on Linux `sed -i` edits files in place directly, while on macOS it requires `sed -i ''` (or a suffix like `.bak`) to work without errors.

## 2025-10-30 THU
- very busy with holiday preparations but practiced tr, uniq, and wc in a spare moment. Super proud that I showed up.

## 2025-10-31 FRI
- refreshed knowledge of `chmod`, `chown`, and `chgrp` commands
- reviewed the difference between `gzip` (compresses a single file) and `tar` (bundles multiple files, with optional compression)
- learned that `tar -czvf` creates a compressed `.tar.gz` archive directly (using gzip), while `tar -cjvf` uses bzip2 for stronger but slower compression

## 2025-11-01 SAT
- had my first live class with the DevOps training group. Learned how virtualization lets several systems share one physical machine. It helped me understand how servers can run many isolated environments at the same time and why this is important for efficient use of hardware.  
- practiced Linux environment variables. Used `export` to create a variable, `unset` to remove it, and added it to `~/.bashrc` to make it permanent. Learned that variables created with `export` only last for one session unless saved in a config file.  
- compared `printenv` and `env`. Learned that both show environment variables, but `env` can also run commands with temporary variable values.  
- created and ran a simple shell script to display some environment variables. Learned that a script can only access variables that were exported, which helped me understand how environment inheritance works between a shell and its child processes.  

## 2025-11-02 SUN
- practiced regex patterns through https://regexlearn.com/learn/regex101 - it was alright but for some reason the last lessons had no practice part. I will try https://regexone.com/ next, then https://scrimba.com/learn-regular-expressions-c0d. One can never have enough practice. I don't think having a regex cheat sheet is ever enough.

## 2025-11-04 TUE
- continued regex practice with https://regexone.com/ as planned. Repetition really makes perfect.

## 2025-11-05 WED
- am I a regex pro or what? It all makes sense now. I can easily use it with `grep -E` or `sed -E` now.
- refreshed memory of basic Linux user CRUD commands: id, useradd, usermod, userdel, groups, groupadd, passwd
- unexpected lessons: (1/2) `whoami` prints who you are, `sudo whoami` prints who you become when using `sudo`; (2/2) To add user to sudoers on Ubuntu/Debian execute `sudo usermod -aG sudo <username>` and on RedHat/CentOS/Fedora `sudo usermod -aG wheel <username>` - optionally do it through `visudo`

## 2025-11-06 THU
- studied how the Linux terminal, shell, and kernel interact. Finally understood something that confused me years ago. Back in 2016, when I worked in support for a Linux-based application, I used to tell users to run installation scripts with `bash <filename>.sh`. The developers insisted on using `./<filename>.sh`, but they couldn’t really explain why (I suspect they were interns). Now it’s clear: running a script with bash forces it to execute in the Bash shell, while `./<filename>.sh` runs it using the shell specified in the script’s first line — the shebang (#!/bin/bash, for example). This makes scripts portable across systems with different default shells.
- wrote a simple shell script with variables, arithmetic operations, and user input to get a feel for the syntax. Bash scripting feels surprisingly natural. Hope it’s not my famous final words.

## 2025-11-09 SUN
- learned how to run commands in the background by adding `&` at the end — useful when a process might take a while but you still want to keep working (e.g., `sleep 500 &`). You can view all background jobs with `jobs`.
- discovered how to bring a process back to the foreground using `fg <jobID>` or send it back to the background with `bg <jobID>`. They’ll still stop once the terminal window is closed, though — so no sneaky long runs after you log out.
- explored various options in the `top` command to get familiar with its interface and understand system resource usage in real time.

## 2025-11-19 WED
- reviewed the `ps` command and its useful options, like `-e` to display processes from all users and `-f` for a fuller view that includes the path to the executable.
- practiced the `kill` command and learned the difference between SIGTERM (signal 15) for graceful termination and SIGKILL (signal 9) for forceful termination. Also confirmed that running `kill <PID>` with no option sends SIGTERM by default.

## 2025-11-20 THU
- learned how `nohup` lets a process keep running even after the terminal closes — useful for long-running tasks or when I need to move on to other work without keeping the session open. The common pattern is `nohup python app.py > out.log 2> err.log &`` to redirect stdout and stderr separately. If I just run `nohup python app.py &``, everything goes into the default `nohup.out`.
- practiced using `disown` for jobs I’ve already sent to the background but still want to survive logout. I can list background jobs with jobs -l and detach a specific one using disown %<jobID>. The trade-off is that once a job is disowned, I can’t redirect its output anymore.

## 2025-11-21 FRI
- got acquainted with the `nice` and `renice` commands. `nice` starts a process with a specific priority, while `renice` adjusts the priority of a process that’s already running. Priorities range from -20 (highest, requires `sudo`) to 19 (lowest). Basic usage: `nice -n 10 my_program` and `sudo renice -n -5 -p <PID>`.

## 2025-11-22 SAT
- spent the day reviewing past lessons. Slower pace, but I often find it very useful — things clicked into place that felt fuzzy the first time around.

## 2025-11-25 TUE
- refreshed my understanding of the Linux filesystem hierarchy and the purpose of the main directories under /. This time it felt much clearer why the structure exists the way it does — it’s surprisingly elegant once you see the logic behind it.
- learned the basics of Red Hat’s package management tools: rpm for low-level package operations, and the higher-level managers (yum and its successor dnf) that handle dependency resolution. 

## 2025-11-27 THU
- practiced special permissions (`u+s`, `g+s`, `+t`) using `chmod` and saw how `setuid`, `setgid`, and the sticky bit change execution rights and behavior in shared environments.
- reviewed how these bits layer on top of normal `rwx` permissions, including examples like how passwd safely uses setuid.
- switched between users and groups to verify permission behavior for some proper first-hand experience.

## 2025-11-28 FRI
- Learned how Access Control Lists (ACLs) extend normal `rwx` permissions with fine-grained rules for specific users and groups, plus default ACLs for new files.
- Practiced viewing and editing ACLs using `getfacl` and `setfacl`:
  - View: `getfacl file`  
  - Add entry: `setfacl -m u:<user>:rw file`  
  - Remove entry: `setfacl -x u:<user> file`  
  - Set default ACL: `setfacl -d -m g:<group>:rwx dir`
- Reviewed how the ACL mask limits effective permissions — e.g., even if an ACL grants `rwx`, a mask of `r--` reduces the user’s actual access to read-only.

## 2025-12-01 MON
- learned how `find` searches the filesystem in real time using filters like `-name`, `-type`, `-size`, and `-maxdepth`. It's accurate, flexible, and always reflects the current state of the system. 
- understood how `locate` works differently: it searches a prebuilt index instead of the live filesystem. It's extremely fast, but it won’t show newly created files until the database is updated with `sudo updatedb`.
- compared them in practice: `find` is the tool for live, precise searches; `locate` is ideal for quick lookups when speed matters but freshness isn’t critical.

## 2025-12-04 THU
- tested rsync (e.g. `rsync -rv --delete source/ destination/` — without `--delete` it won’t remove files that exist only in destination/) and compared dirs with `diff -r`. `rsync` is one-directional and stateless, meaning it doesn’t track history or conflicts, can’t tell if both sides changed a file, and running it both ways can overwrite changes.
- practiced vim again (via Vim Adventures) and picked up a few handy motions: `C`/`D` for editing to end-of-line, and `diw`/`ciw` for deleting or changing whole words.

## 2025-12-05 FRI
- Reviewed basic network tools with quick tests:
  - `ifconfig` to view interfaces/addresses (`ifconfig eth0`).
  - `ip link` to inspect or toggle interfaces (`ip link set eth0 down / up`).
  - `ping <host>` to check reachability and latency (`ping 8.8.8.8`).
  - `traceroute <host>` to see the path packets take (`traceroute google.com`).
  - `netstat -tulpn` to list listening ports and processes.
  - `nslookup <domain>` for basic DNS lookups (`nslookup example.com`).

## 2025-12-08 MON
- repeated material from last 3 sessions to solidify new information

## 2025-12-09 TUE
- touched briefly on shell scripting (variables, loops, functions). Material didn’t go deep, so I decided to spin off a side quest into shell scripting and basic networking before moving forward.

## 2025-12-10 WED
- spun up a CentOS VM on DigitalOcean — first time using a cloud VM, so getting it deployed and connected was part of the learning. Played with `echo`, variable assignment/reassignment, and simple appending to get comfortable working in that environment.

## 2025-12-12 FRI
- started Jason Cannon’s Learn how to shell script through project-based training course. Focused on basic Bash syntax and control flow; noted useful built-ins like `${?}` for checking the exit status of the last command.

## 2025-12-15 MON
- practiced shell scripting with real admin tasks: used `useradd`, `passwd`, and `read -p` to build executable scripts that automate user creation, password setup, and password expiration.

## 2025-12-28 SAT
- wrote a bash script to generate random passwords using `$RANDOM`, timestamps (`date +%s%N`), hashing with `sha256sum`, and truncation via `head -c`.
- improved password strength by combining time + randomness and appending a randomly selected special character using `fold`, `shuf`, and `head`.
- key takeaway: password strength is about entropy, not just length or “looking random” — combining multiple independent sources increases unpredictability.

## 2026-01-02 FRI
- went deeper into shell scripting fundamentals: how scripts receive arguments (`$0`, `$1`, `$2`, `$#`), how PATH affects command execution (and checking with `which`), and how to safely handle filenames using `basename` and `dirname`.
- practiced looping over arguments and finally internalized the difference between `$@` (proper word splitting) and `$*` (everything as one string). Also reinforced the habit of checking for missing arguments and printing usage instead of letting scripts fail without any notice.

## 2026-01-05 MON
- Started working on a script that creates users using command-line arguments. The first argument is the username, and the remaining arguments form the real name stored as a comment. I struggled at first but found two solutions:
  1. Take the first argument as the username, use `shift` to remove it from the positional parameters, and store the remaining arguments as the comment using `$*`.
  2. Take the first argument as the username and the remaining ones as the comment using `${@:2}`. I need more time to fully understand this positional-parameter slicing syntax.

## 2026-01-07 WED
- I learned more about positional parameter expansion: `${@:start:length}`, the counting starts from 1, and the length refers to number of arguments. For example, for the command `./script.sh john John Doe Smith` there are the following results based on the set array slicing:
  - `${@:2}` = John Doe Smith (everything from position 2 onward)
  - `${@:1}` = john John Doe Smith (everything from position 1 onward)
  - `${@:2:2}` = John Doe (2 parameters starting from position 2)
  - `${@:3}` = Doe Smith (everything from position 3 onward)
- I am getting more efficient at reading `man` pages and quickly finding what I need
- each time I use `vim`, I learn something to optimize using it and saving time - I hope this means I'm becoming "THE" IT guy. Learned today: `{` / `}` for navigation, `ci"` to edit content between quotes, and `set nu!` to toggle displaying line numbers.

## 2026-01-08 THU
- learned about file descriptors: stdin (0), stdout (1), stderr (2). Practiced basic redirection with `>`, `<`, and `>>`. Understanding that pipes pass data between commands while redirection uses files helped clarify when to use each.
- explored explicit file descriptor syntax: can redirect stdout and stderr separately (`command 1> output.txt 2> errors.txt`) or combine them (`command > file 2>&1`). Order matters - `2>&1` must come after stdout redirection.
- discovered `/dev/null` for discarding unwanted output (e.g., `command 2> /dev/null` to suppress known errors). These redirection techniques will be essential for writing scripts that handle errors.

## 2026-01-09 FRI
- built a complete user creation script that ties together everything from the past week: argument handling, error checking with `${?}`, and I/O redirection. Used `&> /dev/null` to suppress verbose command output and keep the script's own messages clean.
- implemented proper error handling by checking root privileges `([[ $UID -ne 0 ]])`, verifying arguments were provided, and validating that `useradd` and `passwd` succeeded before continuing. Each failure exits with a clear error message sent to `stderr` using `>&2`.
- combined multiple concepts into one working tool: positional parameters for username/comment, password generation with d`ate +%s%N | sha256sum | head -c48`, and `passwd -e` to force password change on first login. The script now provides clean, essential output showing username, temporary password, and hostname - feels like building something actually useful.

## 2026-01-10 SAT
- reviewed recent lessons and practiced a bit more standard input/output/error redirection, since I didn't feel like I internalized it enough.

## 2026-01-15 THU
- learned how to comment multiple lines in vim and I've never thought that I will view it as an achievement:
  1. Go to the beginning of the first line of the text you want to comment.
  2. `Ctrl + v` to enter visual block.
  3. `j` to navigate to the last line of the text.
  4. `Shift + i` to enter insert mode.
  5. Type `#` (it will display only on the first line initially).
  6. Press `Esc`.
  7. Congratulate yourself.
- practiced using case statement in bash scripting - the syntax is really something else from what I'm used to from high level programming languages but I'll learn

## 2026-01-26 MON
- went deeper into bash functions, focusing on interaction with command-line arguments and how positional parameters are scoped inside functions.
- practiced organizing scripts around functions and using `local` variables to avoid global leakage.
- implemented simple backup logic before making file changes and added error handling that logs failures to syslog instead of stdout.

## 2026-01-29 THU
- learned and used `getopts` for option parsing in bash scripts. Added flags to a password generator script: `-v` to enable verbose output, `-s` to append a special character, and `-l <num>` to control password length. Much cleaner and more scalable than positional arguments.

## 2026-01-30 FRI
- learned how `OPTIND` works together with `getopts`: after option parsing, `shift $((OPTIND - 1))` removes all processed flags and leaves only remaining positional arguments.
- used this pattern to detect invalid extra arguments (`[[ $# -gt 0 ]]`) and fail fast with a `usage` message instead of ignoring user mistakes.
- takeaway: `getopts` validates *options*, `OPTIND + shift` validates that nothing unexpected was passed.

## 2026-02-13 FRI
- practiced `cut`, `awk`, `sort`, and `uniq`  commands
- build complex pipelines connecting those commands to get specific, sorted output, sometimes displaying unique results, sometimes counting repeated occurences.

## 2026-02-14 SAT
- created a script `show-attackers.sh` to capture IP addresses from failed login attempts and identify potential attackers. 
- the course I'm doing used command `geoiplookup` to find IP's location but that command is no longer supported on CentOS, so as a workaround I used `curl -s ipinfo.io/${IP}/country`. I also excluded private IP ranges from the search.
