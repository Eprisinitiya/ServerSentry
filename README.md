# ServerSentry

# 🚀 Server Performance Stats

Server-sentry Bash script for real-time Linux server performance monitoring with system insights.


## 📊 Overview

`server-sentry.sh` is a lightweight yet powerful Bash script that provides instant visibility into critical server performance metrics. Whether you're troubleshooting performance issues, monitoring resource utilization, or just keeping an eye on your system, this tool delivers the insights you need in a clean, organized format.

## ✨ Features

- **CPU Usage Analysis**: Real-time CPU utilization percentage
- **Memory Management**: Complete memory statistics with usage percentages
- **Disk Space Monitoring**: Filesystem usage across all mounted partitions
- **Process Prioritization**: Identifies top resource-consuming processes
- **System Context**: OS details, uptime, and load averages
- **Security Insights**: User session tracking and failed login attempts
- **Network Visibility**: Interface status and active connections


## 🚀 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Eprisinitiya/ServerSentry.git
   ```

2. Make the script executable:
   ```bash
   chmod +x server-sentry.sh
   ```

3. Run the script:
   ```bash
   ./server-sentry.sh
   ```

## 🔧 Requirements

- Linux-based operating system
- Basic utilities: `ps`, `top`, `free`, `df`, `who`, `netstat`, `ip`
- Optional: `bc` (for percentage calculations)


## 🔒 Note

This script may access sensitive system information. When running in production environments:

- Review the script to ensure it meets your security requirements
- Consider running with appropriate permissions (root access may be needed for some metrics)
- Be cautious when sharing output reports as they contain system information

⭐ Star this repository if you find it useful! ⭐
