window.onload = get_data();

//função que muda a cor da temperatura
function changeTempColor(avarange,min,max) {

    $('#displayTemp').removeClassStartsWith('b');

    if (avarange < max && avarange > min) {
        $('#displayTemp').addClass('badge badge-success');
    }
    else if (avarange <= min) {
        $('#displayTemp').addClass('badge badge-primary');
    }
    else {
        $('#displayTemp').addClass('badge badge-danger');
    }
  
}

//função que busca e retorna a temperatura no servidor node.
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
    return obj.average;
}


setInterval(() => {
    get_data();
}, 1000);