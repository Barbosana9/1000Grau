//Função para o JQuery que remove uma classe que começa com determinada letra
$.fn.removeClassStartsWith = function (param) {
    return this.each(function () {
        var classes = this.className.split(/\s+/g),
            newclasses = [];

        $.each(classes, function (_, klass) {
            if ($.trim(klass).indexOf(param) !== 0)
                newclasses.push($.trim(klass));
        });

        this.className = newclasses.join(' ');
    });
}