var Connection = require('tedious').Connection;  
var config = {  
    userName: 'picanha@milgrau',  
    password: 'info@211',  
    server: 'milgrau.database.windows.net',  
    // If you are on Microsoft Azure, you need this:  
    options: {encrypt: true, database: 'LolDataBase'}  
};  
var connection = new Connection(config);  
connection.on('connect', function(err) {  
    if (err) {
        console.error('Erro ao tentar conexão com banco '+err);
    } else {
        console.log("Conectado com o SQL Server");  
    }
}); 


var Request = require('tedious').Request  
var TYPES = require('tedious').TYPES;  

function inserirRegistro(valor) {  
    request = new Request("INSERT INTO temperaturaLog (temp) values (@valor);", function(err) {  
     if (err) {  
        console.log(err);}  
    });  
    request.addParameter('valor', TYPES.Float, valor);  
    connection.execSql(request);  
} 