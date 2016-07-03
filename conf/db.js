var mysql = require('mysql');

var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database:'dfgy',
    port: '3306',
});

conn.connect(function (err) {
    if (err) {
        console.log(err);
        console.log('unconnected');
    } else {
        console.log('connected');
    }
    ;
});

module.exports = conn;