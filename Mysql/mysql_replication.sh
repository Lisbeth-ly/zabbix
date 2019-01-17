#!/bin/bash
function slave_io {
        mysql -uzabbix -e 'show slave status\G' | grep "Slave_IO_Running" | awk '{print $2}' | grep -c Yes
}
function slave_sql {
        mysql -uzabbix -e 'show slave status\G' | grep "Slave_SQL_Running" | awk '{print $2}' | grep -c Yes
}

function Seconds_Behind_Master {
        mysql -uzabbix -e 'show slave status\G' | grep "Seconds_Behind_Master" | awk '{print $2}'
}

$1
