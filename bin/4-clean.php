#!/usr/bin/env php
<?php declare(strict_types=1);

require_once __DIR__ . '/../inc/common.php';

function main( $argv ) {

  $pdo = new_pdo();

  echo "summarizing data...\n";

  echo "truncating t_clean table...\n";

  $sql = "
    truncate table t_clean;
  ";

  $pdo->exec( $sql );

  echo "inserting clean data into t_clean...\n";

  $sql = "
    insert into t_clean (
      a_date,
      a_serial_number,
      a_model,
      a_capacity_bytes,
      a_failure,
      a_datacenter,
      a_cluster_id,
      a_vault_id,
      a_pod_id,
      a_pod_slot_num
    )
    select
      date,
      serial_number,
      model,
      capacity_bytes,
      failure,
      datacenter,
      cluster_id,
      vault_id,
      pod_id,
      pod_slot_num
    from
      t_backblaze
  ";

  $pdo->exec( $sql );

  echo "done.\n\n";

}

main( $argv );
