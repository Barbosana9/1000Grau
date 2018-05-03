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
