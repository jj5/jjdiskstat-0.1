# jjdiskstat: Disk Statistics from Backblaze

These scripts are for downloading and processing hard disk statistics data from Backblaze:

- https://www.backblaze.com/cloud-storage/resources/hard-drive-test-data

There are some notes over here:

- https://blog.jj5.net/blog/2025/06/28/new-hard-drives/

## config.php

The config.php file should look something like this:

```php
define( 'DB_HOST', 'localhost' );
define( 'DB_NAME', 'jjdiskstat' );
define( 'DB_USER', 'jjdiskstat' );
define( 'DB_PASS', '**secret**' );
```

© Copyright 2025 John Elliot V. All rights reserved.
