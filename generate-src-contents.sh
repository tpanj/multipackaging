#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Check if it ends with "/src"
if [[ $current_dir == */src ]]; then
cat > hello-world << EOF
#!/usr/bin/env bash

#
# == hello-world 0.1.0 ==
#

echo "Hello, world!" | lolcat
EOF
chmod +x hello-world

cat > hello-world.1 << EOF
.TH HELLO WORLD "1" "July 2021" "hello-world 0.1.0" "User Commands"
.SH NAME
hello-world \- manual page for hello-world 0.1.0
.SH DESCRIPTION
.IP
USAGE: hello-world
.SH "SEE ALSO"
.IP
Website: https://example.com/hello-world
.SH "OTHER"
.IP
Made by You The Amazing Person <you are an amazing person at example dot com>
.IP
This program is distributed under the AGPL 3.0 license.
EOF
else
    echo "You are not in the src subfolder."
fi
