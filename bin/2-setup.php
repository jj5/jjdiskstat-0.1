#!/usr/bin/env php
<?php declare(strict_types=1);

require_once __DIR__ . '/../inc/common.php';

function main( $argv ) {

  $pdo = new_pdo();

  echo "setting up database...\n";

  drop_views( $pdo );

  echo "creating t_backblaze table...\n";

  run_sql_file( __DIR__ . '/../sql/t_backblaze.sql', $pdo );

  echo "creating t_clean table...\n";

  run_sql_file( __DIR__ . '/../sql/t_clean.sql', $pdo );

  create_views( $pdo );

  echo "done.\n\n";

}

main( $argv );
