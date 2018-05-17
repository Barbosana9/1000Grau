$(document).ready(function preSetPage() {
    //definindo as configurações inicias do grafico
    google.charts.load('current', { packages: ['corechart', 'line'] });
    google.charts.setOnLoadCallback(drawChart);
    //mandando obter a temperatura no bando de dados
    getActualTemp();
});

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


function getActualTemp() {
    $.ajax({
        type: "POST",
        url: "../grelha.aspx/getTempeture",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function (response) {
            alert(response.d);
        }
    });
}
function OnSuccess(response) {
    changeTempColor(response.d, 0.0, 30.0);
    document.getElementById('displayTemp').textContent = response.d;
    //atualizando os valores do grafico
    drawChart(response.d);
}

setInterval(() => {
    getActualTemp();
}, 1000);

//apartir daqui todo relacionado ao grafico
var data = null, grafico = null,total = 1;

function drawChart(temp) {

        if (data == null) {
            data = new google.visualization.DataTable();
            data.addColumn('number', 'Tempo');
            data.addColumn('number', 'ºC');
        }

        data.addRows([[total,temp]]);

        grafico = new google.visualization.LineChart(document.getElementById('curve_chart'));
        grafico.draw(data, { title: "Temperaturas em Tempo Real" });

    total++;
}
// 

