# jjdiskstat: Disk Statistics from Backblaze

These scripts are for downloading and processing hard disk statistics data from Backblaze:

- https://www.backblaze.com/cloud-storage/resources/hard-drive-test-data

There are some notes over here:

- https://blog.jj5.net/blog/2025/06/28/new-hard-drives/

## Processing

So the process is basically:

- download a data file for a recent quarter (2025 Q1)
- create the database schema
- import the CSV files into the `t_backblaze` table
- clean-up the imported data and stash it in the `t_clean` table
- materialize the various views for fast queries

The final report is in the `t_report` table.

## config.php

The config.php file should look something like this:

```php
define( 'DB_HOST', 'localhost' );
define( 'DB_NAME', 'jjdiskstat' );
define( 'DB_USER', 'jjdiskstat' );
define( 'DB_PASS', '**secret**' );
```

© Copyright 2025 John Elliot V. All rights reserved.
