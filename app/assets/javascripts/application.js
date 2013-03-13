// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

/**
 * efeito alert
 */
$(function () {
    var corpo_alert = $("#alert-message");

    if (corpo_alert.length) {
        setTimeout(function () {
            corpo_alert.fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500)
        }, 200);
    }
});

/**
 * efeito aguarde button
 */
$(function () {
    $(".aguarde").bind("click", function (e) {
        var btn = $(this);
        var texto = "Aguarde...";

        if ($(this).text().length)
            btn.attr("data-loading-text", texto).button("loading");
        else
            btn.attr("data-toggle", "button").button();
    });
});

/**
 * serviço modal ajax
 */
$(function () {
    var data = {
        tipo_contrato_ajax: {
            button_id: "#tipo_contrato_ajax",
            url_new: "/tipo_contratos/new",
            modal_id: "#modal-tipo-contrato"
        },
        partido_ajax: {
            button_id: "#partido_ajax",
            url_new: "/partidos/new",
            modal_id: "#modal-partido"
        },
        pessoa_ajax: {
            button_id: "#pessoa_ajax",
            url_new: "/pessoas/new",
            modal_id: "#modal-pessoa"
        }
    }
    var button_ids_click = data.tipo_contrato_ajax.button_id + ", " + data.partido_ajax.button_id + ", " + data.pessoa_ajax.button_id

    $(button_ids_click).click(function (e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            data: {
                modal_ajax: true
            },
            url: data[e.target.id].url_new,
            beforeSend: function () {
                $(data[e.target.id].modal_id).modal('show');
            },
            success: function (response) {
                $(data[e.target.id].modal_id).find(".modal-body").html(response);
            },
            complete: function () {
            }
        });
    });
});

/**
 * mask input
 */
$(function () {
    // mas valor
    $(".valor").maskMoney({showSymbol:true, symbol:"R$ ", decimal:",", thousands:"."});


    // mask CPF
    $(".maskinput-cpf").mask("999.999.999-99");

    // mask CNPJ
    $(".maskinput-cnpj").mask("99.999.999/9999-99");

    //mask telefones
    $(".maskinput-telefone").mask("(99)9999-9999");

    //mask cep
    $(".maskinput-cep").mask("99999-999");

    $('#cargo-categorias-tp').popover({
        title: 'Ajuda',
        trigger: 'hover',
        content: 'Aqui você define a estrutura de cargos e categorias para cada contrato. Ex.: Contrato Cast - Analista de Suporte 5'
    })
    $('#vagas-tp').popover({
        title: 'Ajuda',
        trigger: 'hover',
        content: 'Aqui você controla as vagas disponíveis na prefeitura. A vaga é a junção de um mapa de cargo e categoria com uma lotação.'
    })
    $('#contratacoes-tp').popover({
        title: 'Ajuda',
        trigger: 'hover',
        content: 'A contratação é a alocação de uma pessoa em determinada vaga.'
    })
    $('#indicadores-tp').popover({
        title: 'Ajuda',
        trigger: 'hover',
        content: 'Indicador é aquele que indica uma pessoa. Será utilizado na hora de cadastrar uma pessoa.'
    })
});

/**
 * efeitos widget
 */
$(function () {
    $('.widget .widget-header i').bind("click", function () {
        $(this).toggleClass("icon-arrow-down icon-arrow-up");
        $(this).closest('.widget').find('.widget-content').slideToggle('fast');
    }).css('cursor', 'pointer');
});



