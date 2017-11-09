# Logrotate

Manages rotation of logs via the ['logrotate'](https://github.com/logrotate/logrotate) utility.

## Attributes

```
node['cas_logrotate']['entries']['<entry-name>'] = (
    logs:          <string>  # Path to log files
    su:            <string>  # User and group to `su` into before rotation
    frequency:     <string>  # Frequency of rotation (daily/weekly/monthly/etc)
    notifempty:    <boolean> # Skip rotation if file is empty
    size:          <string>  # Skip rotation if file smaller than attribute
    rotate:        <string>  # Number of rotated logs to keep
    maxage:        <string>  # Remove logs older than n number of days
    create:        <string>  # Create new file with defined attributes
    compress:      <boolean> # Compress rotated files
    delaycompress: <boolean> # Compress file only after second rotation
    dateext:       <boolean> # Use date in name of rotated file
    missingok:     <boolean> # Suppress error if file is missing
    copytruncate:  <boolean> # Copy and truncate file in place instead of moving and recreating
    prerotate:     <string>  # Script to run before rotation
    postrotate:    <string>  # Script to run after rotation
    sharedscripts: <string>  # Run pre/postrotate scripts only once for all logs
)
```

### Example Role

The following role will create `/etc/logrotate.d/example`, matching the entry created in the Kitchen test suite.

```
name 'logrotate'
description 'Configure logrotate'

run_list(
    'recipe[cas_logrotate]'
)

default_attributes({
    logrotate: {
        entries: {
            example: {
                logs: '/var/log/example/*.log',
                su: 'root root',
                frequency: 'daily',
                notifempty: true,
                size: '1m',
                rotate: '10',
                maxage: '14',
                create: '0644 root root',
                compress: true,
                delaycompress: true,
                dateext: true,
                missingok: true,
                copytruncate: true,
                prerotate: 'echo "prerotate command"',
                postrotate: 'echo "postrotate command"',
                sharedscripts: true
            }
        }
    }
})
```
