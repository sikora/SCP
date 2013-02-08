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
 * set active menu lateral
 */
$(function() {
	var menu_selecionado = window.location.pathname.split("/")[1];
	var obj_menu_lateral = $("#menu-lateral ul");
	var obj_menu_ativo = $("li.active", obj_menu_lateral);
	var obj_menu_encontrado = $("a[href*='" + menu_selecionado + "']", obj_menu_lateral);

	if (obj_menu_encontrado.length) {
		obj_menu_ativo.removeClass().find("i").removeClass("icon-white");
		obj_menu_encontrado.parent().addClass('active').find("i").addClass('icon-white');
	};
});
