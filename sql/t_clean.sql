drop table if exists t_clean;

create table t_clean(
  a_aid int unsigned not null auto_increment primary key,
  a_date date not null,
  a_serial_number varchar(255) not null,
  a_model varchar(255) not null,
  a_capacity_bytes bigint not null,
  a_failure boolean not null,
  a_datacenter varchar(255) not null,
  a_cluster_id varchar(255) not null,
  a_vault_id int not null,
  a_pod_id int not null null,
  a_pod_slot_num varchar(255) not null,
  index idx_serial_number (a_serial_number),
  index idx_date (a_date),
  index idx_model (a_model),
  index idx_capacity_bytes (a_capacity_bytes)
)
DEFAULT CHARACTER SET ascii
COLLATE ascii_general_ci;
