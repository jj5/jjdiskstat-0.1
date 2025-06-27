#!/usr/bin/env php
<?php declare(strict_types=1);

require_once __DIR__ . '/../../inc/common.php';

function main( $argv ) {

  $pdo = new_pdo();

  echo "dropping views...\n";

  drop_views( $pdo );

  echo "done.\n\n";

}

main( $argv );
