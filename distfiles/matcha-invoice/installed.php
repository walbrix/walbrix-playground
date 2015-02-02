<?php
/**
 * @copyright ICZ Corporation (http://www.icz.co.jp/)
 * @license See the LICENCE file
 * @author <matcha@icz.co.jp>
 * @version $Id$
 */
//DB接続
Configure::write('DB_SETTING', array(
	'driver' => 'mysql',
	'persistent' => false,
	'host' => 'localhost',
	'login' => 'matcha-invoice',
	'password' => '',
	'database' => 'matcha-invoice',
	'prefix' => '',
	'encoding' => 'utf8',
));
