<?php
defined('BASEPATH') or exit('No direct script access allowed');

$active_group = 'default';
$query_builder = TRUE;


$db['default'] = array(
	'dsn'	=> '',
	'hostname' => 'localhost',
	'username' => 'komuni39_kap',
	'password' => '@Infinit2020',
	'database' => 'komuni39_kap',
	'username' => 'root',
	'password' => '',
	'database' => 'kap_ms_system',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);
