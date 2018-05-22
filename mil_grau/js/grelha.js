$(document).ready(function preSetPage() {
    //definindo as configurações inicias do grafico
    google.charts.load('current', { packages: ['corechart', 'line'] });
    google.charts.setOnLoadCallback(drawChart);
    //mandando obter a temperatura no bando de dados
    getActualTemp();
});

//função que muda a cor da temperatura
function changeTempColor(avarange, min, max) {

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
    document.getElementById('displayTemp').textContent = response.d.toFixed(1) + " ºC";
    //atualizando os valores do grafico
    drawChart(response.d);
}

setInterval(() => {
    getActualTemp();
}, 1000);

//apartir daqui todo relacionado ao grafico
var data = null, grafico = null, total = 1;

function drawChart(temp) {

    if (data == null) {
        data = new google.visualization.DataTable();
        data.addColumn('number', 'Tempo');
        data.addColumn('number', 'ºC');
    }

    data.addRows([[total, temp]]);

    grafico = new google.visualization.LineChart(document.getElementById('curve_chart'));
    grafico.draw(data, { title: "Temperaturas em Tempo Real" });

    total++;
    escreverMedias(temp);
}

var temperaturas = [100];
var i = 0;

function escreverMedias(temperatura) {
    temperaturas[i] = temperatura;
    
    if (i == 99) {
        i = 0;

        temperaturas.sort(function (a, b) { return a - b });

        $('#LBLmedia').text(calcularMedia().toFixed(1) + " ºC");
        $('#LBL1quartil').text(calcularQuartil(1).toFixed(1) + " ºC");
        $('#LBLmoda').text(calcularModa().toFixed(1) + " ºC");
        $('#LBLmediana').text(((temperaturas[49] + temperaturas[50]) / 2).toFixed(1) + " ºC");
        $('#LBLminima').text(temperaturas[0].toFixed(1) + " ºC");
        $('#LBL2quartil').text(calcularQuartil(2).toFixed(1) + " ºC");
        $('#LBLmaxima').text(temperaturas[98].toFixed(1) + " ºC");
    }

    i++;
}

function calcularMedia() {
    var media = 0;

    for (i = 0; i < 99; i++) {
        media = media + temperaturas[i]
    }

    return media / 99;
}

function calcularQuartil(qual) {

    if (qual == 1) {
        return temperaturas[25];
    }
    else {
        return temperaturas[26];
    }
    return 0.00;
}

function calcularMaxima() {
    
}
function calcularMinima() {
    return;
}
function calcularModa() {

    var array = temperaturas;

        if (array.length == 0)
            return null;
        var modeMap = {};
        var maxEl = array[0], maxCount = 1;
        for (var i = 0; i < array.length; i++) {
            var el = array[i];
            if (modeMap[el] == null)
                modeMap[el] = 1;
            else
                modeMap[el]++;
            if (modeMap[el] > maxCount) {
                maxEl = el;
                maxCount = modeMap[el];
            }
        }
        return maxEl;
}
