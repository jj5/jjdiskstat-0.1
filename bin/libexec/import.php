#!/usr/bin/env php
<?php declare(strict_types=1);

require_once __DIR__ . '/../../inc/common.php';

function main( $argv ) {

  $data = $argv[ 1 ];

  $pdo = new_pdo();

  echo "importing data...\n";

  echo "truncating t_backblaze table...\n";

  $sql = "
    truncate t_backblaze;
  ";

  $pdo->exec( $sql );

  echo "changing directory to /var/lib/mysql...\n";

  chdir( '/var/lib/mysql' ) or die ( "failed to change directory to: /var/lib/mysql\n" );

  $data_dir = "backblaze/$data";

  chdir( $data_dir ) or die ( "failed to change directory to: $data_dir\n" );

  echo "loading data from files in $data_dir...\n";

  foreach ( scandir('.') as $file ) {

    if ( is_dir( $file ) ) { continue; }

    echo "processing file: $file...\n";

    $sql = "
      LOAD DATA INFILE '$data_dir/$file'
      INTO TABLE t_backblaze
      FIELDS TERMINATED BY ','
      OPTIONALLY ENCLOSED BY '\"'
      LINES TERMINATED BY '\n'
      IGNORE 1 LINES;
    ";

    $pdo->exec( $sql );

  }

  echo "done.\n\n";

}

main( $argv );
