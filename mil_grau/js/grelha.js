$(document).ready(function preSetPage() {
    //definindo as configurações inicias do grafico
    google.charts.load('current', { packages: ['corechart', 'line'] });
    google.charts.setOnLoadCallback(drawChart);
    //mandando obter a temperatura no bando de dados

    setInterval(() => {
        getActualTemp();
    }, 3000);

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
    setTimeout(
        function acessarBanco() {
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
        }, 1000);
}
function OnSuccess(response) {
    document.getElementById('displayTemp').textContent = response.d.toFixed(1) + " ºC";
    //atualizando os valores do grafico
    drawChart(response.d);

    if (monitoramento.maxima != null && monitoramento.minima != null) {
        changeTempColor(response.d, monitoramento.minima, monitoramento.maxima);
    }
}

//apartir daqui todo relacionado ao grafico
var data = null, grafico = null, total = 0;

function drawChart(temp) {

    if (data == null) {
        data = new google.visualization.DataTable();
        data.addColumn('number', 'Tempo');
        data.addColumn('number', 'ºC');
    }

    if (total > 5) {
        data.removeRow(0);
    }

    data.addRows([[total, temp]]);



    grafico = new google.visualization.LineChart(document.getElementById('chart'));
    grafico.draw(data, {
        //width: 650,
        //height: 400,
        'chartArea': { 'width': '90%', 'height': '80%' },
        'legend': { 'position': 'bottom' },
        title: "Temperaturas em Tempo Real"});

    total++;

    if (total != 1) {
        //console.log(parseFloat(temp.toString()).toFixed(1))
        escreverMedias(parseFloat(temp.toString()).toFixed(1));
    }
}

var temperaturas = [100];
var i = 0;

function escreverMedias(temperatura) {
    temperaturas[i] = temperatura;

    if (i > 99) {

        i = 0;
        temperaturas.sort(function (a, b) { return a - b });

        $('#LBLmedia').text(calcularMedia() + " ºC");
        $('#LBLminima').text(temperaturas[0] + " ºC");
        $('#LBL1quartil').text(temperaturas[24] + " ºC");
        $('#LBLmoda').text(calcularModa() + " ºC");
        $('#LBLmediana').text(calcularMediana(temperaturas[49], temperaturas[50]) + " ºC");
        $('#LBL2quartil').text(temperaturas[74] + " ºC");
        $('#LBLmaxima').text(temperaturas[99]+ " ºC");
               
    }

    i++;
}

function calcularMedia() {
    var media = 0;

    for (u = 0; u < 100; u++) {
        media = media + parseFloat(temperaturas[u]);
    }

    return media / 100.0;
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

function calcularMediana(v1,v2){
    return ((parseFloat(v1) + parseFloat(v2)) / 2);
}

var monitoramento = [];
monitoramento.maxima = null;
monitoramento.minima = null;

function definirTemperaturas(minima, maxima) {
    monitoramento.maxima = parseFloat(maxima);
    monitoramento.minima = parseFloat(minima);
}



