<?php declare(strict_types=1);

$g_view_list = [ 'v_year', 'v_date', 'v_model', 'v_failure', 'v_report' ];

(function(){

  error_reporting( E_ALL );

  ini_set( 'display_errors', '1' );

  set_error_handler( 'handle_error' );

  file_exists( __DIR__ . '/../config.php' ) or die( "config.php not found. Please create it based on config.php.example.\n" );

  require_once __DIR__ . '/../config.php';

  defined( 'DB_HOST' ) or die( "DB_HOST is not defined in config.php\n" );
  defined( 'DB_NAME' ) or die( "DB_NAME is not defined in config.php\n" );
  defined( 'DB_USER' ) or die( "DB_USER is not defined in config.php\n" );
  defined( 'DB_PASS' ) or die( "DB_PASS is not defined in config.php\n" );

})();

function handle_error( int $errno, string $errstr, string $errfile, int $errline ): void {

  throw new ErrorException( $errstr, 0, $errno, $errfile, $errline );

}

function drop_views( $pdo ) {

  $dbname = DB_NAME;

  $sql = "
    select
      table_name
    from
      information_schema.views
    where
      table_schema = :schema
  ";

  $stmt = $pdo->prepare($sql);
  $stmt->execute( [ 'schema' => $dbname ] );
  $views = $stmt->fetchAll();

  foreach ( $views as $row ) {
    $view = $row[ 'table_name' ];
    echo "dropping view: {$view}...\n";
    $sql = "drop view `{$dbname}`.`{$view}`";
    $pdo->exec($sql);
  }

  echo "done.\n";

}

function create_views( $pdo ) {

  global $g_view_list;

  foreach ( $g_view_list as $view ) {

    echo "creating $view view...\n";

    run_sql_file( __DIR__ . "/../sql/$view.sql", $pdo );

  }
}

function materialize_views( $pdo ) {

  global $g_view_list;

  foreach ( $g_view_list as $view ) {

    echo "materializing $view view...\n";

    $table = $view;
    $table[ 0 ] = 't';

    $sql = "drop table if exists `{$table}`";
    $pdo->exec( $sql );

    $sql = "create table `{$table}` as select * from `{$view}`";
    $pdo->exec( $sql );

  }
}

function run_sql_file( $file, $pdo ) {

  if ( ! file_exists( $file ) ) {

    echo "SQL file not found: $file\n";

    exit( 1 );

  }

  $sql = file_get_contents( $file );

  if ( $sql === false ) {

    echo "failed to read SQL file: $file\n";

    exit( 1 );

  }

  try {

    $pdo->exec( $sql );

  }
  catch ( PDOException $ex ) {

    echo "SQL execution failed: " . $ex->getMessage() . "\n";

    exit( 1 );

  }
}

function new_pdo() {

  $host     = DB_HOST;
  $port     = 3306;
  $dbname   = DB_NAME;
  $username = DB_USER;
  $password = DB_PASS;
  $charset  = 'utf8mb4';

  $dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=$charset";

  $options = [
      PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
      PDO::ATTR_EMULATE_PREPARES   => false,
      // 2025-06-27 jj5 - careful when this is enabled because it increases the risk of SQL injection
      PDO::MYSQL_ATTR_MULTI_STATEMENTS => true,
      // 2025-06-27 jj5 - force names lower case
      PDO::ATTR_CASE               => PDO::CASE_LOWER,
  ];

  try {

    return new PDO( $dsn, $username, $password, $options );

  }
  catch ( PDOException $ex ) {

    echo "connection failed: " . $ex->getMessage();

    exit( 1 );

  }
}
