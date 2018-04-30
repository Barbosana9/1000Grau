window.onload = get_data();


function get_data() {

    // realizando a conexao com o servidor node
    var http = new XMLHttpRequest();
    http.open('GET', 'http://localhost:3000/api', false);
    http.send(null);

    var obj = JSON.parse(http.responseText);

    //retornando caso a temperatura não contenha valor
    if (obj.data.length == 0) {
        return;
    }

    //escrevendo no html a temperatura na tag html
    document.getElementById('average').textContent = obj.average;

    
}

var varialvel;

setInterval(() => {
    get_data();
}, 1000);