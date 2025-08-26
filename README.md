# Error Detection – Shell Scripting

A lightweight shell script to scan log files (`system.log`, `application.log`, etc.) for error entries and generate consolidated error reports.

---

## Features

- Searches for error patterns like `ERROR`, `FAIL`, `FATAL`, `EXCEPTION` (configurable).  
- Produces a parsed `log_report.txt` (or `error_report.txt`) summarizing the errors with timestamps.  
- Easy to integrate with cron for periodic execution.  
- Customizable: extend to additional log files or keywords.

---

## Repository Structure

├── analyse-logs.sh # Main shell script
├── system.log # Sample system log
├── application.log # Sample application log
└── log_report.txt # Generated error report

yaml
Copy
Edit

---

## Usage

1. Give execution permission:  
   ```bash
   chmod +x analyse-logs.sh
Run the script directly by passing log files:

bash
Copy
Edit
./analyse-logs.sh system.log application.log
The script parses the logs and outputs log_report.txt (or a similar named file), which contains all detected error entries.

Customization
Change keywords – modify the script to add or remove search patterns.

Add more log sources – include other log file paths as arguments or configure defaults inside the script.

Automation – schedule via cron. For example, to run every hour:

pgsql
Copy
Edit
0 * * * * /path/to/analyse-logs.sh /var/log/system.log /var/log/app.log
Example
After running:

bash
Copy
Edit
./analyse-logs.sh system.log application.log
The log_report.txt will contain lines from the logs that match the defined error patterns. This enables quick identification of critical issues without manual log inspection.

Next Steps / Contributions
Add parsing of log timestamps and grouping by date.

Implement filtering by date ranges or log severity.

Enhance formatting or output to CSV/JSON for integration with dashboards or notification systems.

Contributions and issue reporting are welcome
