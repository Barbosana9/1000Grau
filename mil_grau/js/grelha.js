$(document).ready(function preSetPage() {


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
}

setInterval(() => {
    getActualTemp();
}, 1000);
