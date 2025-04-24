# Print section headers
print_header() {
    echo "=============================================="
    echo "$1"
    echo "=============================================="
}

# Print statistics in a formatted way
print_stat() {
    printf "%-25s: %s\n" "$1" "$2"
}

# Get system information
print_header "SYSTEM INFORMATION"
print_stat "Hostname" "$(hostname)"
print_stat "Operating System" "$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)"
print_stat "Kernel Version" "$(uname -r)"
print_stat "Uptime" "$(uptime -p)"
print_stat "Last Boot" "$(who -b | awk '{print $3, $4}')"

# Get CPU information
print_header "CPU USAGE"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
print_stat "Total CPU Usage" "${cpu_usage}%"

# Get load average
load_avg=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
print_stat "Load Average (1,5,15 min)" "$load_avg"

# Get memory usage
print_header "MEMORY USAGE"
total_mem=$(free -m | grep Mem | awk '{print $2}')
used_mem=$(free -m | grep Mem | awk '{print $3}')
free_mem=$(free -m | grep Mem | awk '{print $4}')
mem_percent=$(echo "scale=2; $used_mem*100/$total_mem" | bc)

print_stat "Total Memory" "${total_mem} MB"
print_stat "Used Memory" "${used_mem} MB (${mem_percent}%)"
print_stat "Free Memory" "${free_mem} MB"

# Get disk usage
print_header "DISK USAGE"
echo "Filesystem Usage:"
df -h | grep -vE 'tmpfs|cdrom|loop' | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}'

# Get top 5 processes by CPU usage
print_header "TOP 5 PROCESSES BY CPU USAGE"
ps aux --sort=-%cpu | head -6

# Get top 5 processes by memory usage
print_header "TOP 5 PROCESSES BY MEMORY USAGE"
ps aux --sort=-%mem | head -6

# Get logged in users
print_header "LOGGED IN USERS"
who

# Get failed login attempts (if /var/log/auth.log exists)
if [ -f /var/log/auth.log ]; then
    print_header "RECENT FAILED LOGIN ATTEMPTS"
    grep "Failed password" /var/log/auth.log | tail -5
else
    print_header "RECENT FAILED LOGIN ATTEMPTS"
    echo "Log file not available or permission denied"
fi

# Get network information
print_header "NETWORK INFORMATION"
echo "Network Interfaces:"
ip -brief addr show

# Network connections summary
print_header "NETWORK CONNECTIONS"
netstat -tuln | head -10

print_header "END OF REPORT"
echo "Report generated on: $(date)"