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
$(function() {
	var corpo_alert = $(".alert, .notice");

	if (corpo_alert.length) {
		setTimeout(function() {
			corpo_alert.fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500)
		}, 500);
	}
});

/**
 * efeito aguarde button
 */
$(function() {
	$(".aguarde").bind("click", function() {
		var btn = $(this);
		var texto = "Aguarde...";

		btn.attr("data-loading-text", texto).button("loading");
	});
});

/**
 * ajax modal pessoa
 */
$(function() {
	$(".criar-pessoa-ajax").click(function(e) {
		e.preventDefault();

		$.ajax({
			type : "POST",
			data : {
				modal_ajax : true
			},
			url : "/pessoas/new",
			beforeSend : function() {
				$("#modal-pessoa").modal('show');
			},
			success : function(response) {
				$("#modal-pessoa").find(".modal-body").html(response);
			},
			complete : function() {
			}
		});
	});
});

/**
 * ajax modal partido
 */
$(function() {
	$(".criar-partido-ajax").click(function(e) {
		e.preventDefault();

		$.ajax({
			type : "POST",
			data : {
				modal_ajax : true
			},
			url : "/partidos/new",
			beforeSend : function() {
				$("#modal-partido").modal('show');
			},
			success : function(response) {
				$("#modal-partido").find(".modal-body").html(response);
			},
			complete : function() {
			}
		});
	});
});

/**
 * ajax modal tipo de contrato
 */
$(function() {
	$(".criar-tipo-contrato").click(function(e) {
		e.preventDefault();

		$.ajax({
			type : "POST",
			data : {
				modal_ajax : true
			},
			url : "/tipo_contratos/new",
			beforeSend : function() {
				$("#modal-tipo-contrato").modal('show');
			},
			success : function(response) {
				$("#modal-tipo-contrato").find(".modal-body").html(response);
			},
			complete : function() {
			}
		});
	});
});

/**
 * mask input
 */
$(function() {
	// mask CPF
	$(".maskinput-cpf").mask("999.999.999-99");

	// mask CNPJ
	$(".maskinput-cnpj").mask("99.999.999/9999-99");

	//mask telefones
	$(".maskinput-telefone").mask("(99)9999-9999");

	//mask cep
	$(".maskinput-cep").mask("99999-999");

  $('#cargo-categorias-tp').popover({title: 'Ajuda', trigger: 'hover', content: 'Aqui você define a estrutura de cargos e categorias para cada contrato. Ex.: Contrato Cast - Analista de Suporte 5'} )
  $('#vagas-tp').popover({title: 'Ajuda', trigger: 'hover', content: 'Aqui você controla as vagas disponíveis na prefeitura. A vaga é a junção de um mapa de cargo e categoria com uma lotação.'} )
  $('#contratacoes-tp').popover({title: 'Ajuda', trigger: 'hover', content: 'A contratação é a alocação de uma pessoa em determinada vaga.'} )
  $('#indicadores-tp').popover({title: 'Ajuda', trigger: 'hover', content: 'Indicador é aquele que indica uma pessoa. Será utilizado na hora de cadastrar uma pessoa.'} )
});
