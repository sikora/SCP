$(function() {
  $(".autocomplete").each( function(k, v) {
  	$v = $(v);
  	if($v.attr('url_ac')) {
		$v.ajaxChosen({
		  method: 'GET',
		  url: $v.attr('url_ac'),
		  dataType: 'json',
		}, function (data) {
			console.log(data);
		  var terms = {};
		  var lab = $v.attr('label_ac');
		  var value = $v.attr('val_ac');

		  $.each(data, function (i, val) {
		    terms[val[value]] = val[lab];
		  });

		  return terms;
		});
	}
  });	

  $(".default_chosen").chosen();

  $(".autocomplete_pessoas").ajaxChosen({
    method: 'GET',
		  url: '/pessoas.json',
		  dataType: 'json',
		}, function (data) {
		  var terms = {};

		  $.each(data, function (i, val) {
		    terms[val['id']] = val['nmpessoa'];
		});

    return terms;
  });

  $(".autocomplete_cargo_categorias").ajaxChosen({
    method: 'GET',
		  url: '/cargo_categorias.json',
		  dataType: 'json',
		}, function (data) {
		  var terms = {};

		  $.each(data, function (i, val) {
		    terms[val['id']] = val['valor'];
		});

    return terms;
  });



  $(".mapa_categoria_chosen").chosen().change(function(event) {
    $.ajax({
      dataType: "json",
      url: '/get_categoria_valor.json?categoria_id='+$(event.target).val(),
      data: data,
      success: function(json) {
        $('#cargo_categoria_valor').val(json.valor);
        console.log(" reponse :"+ json);
      }
    });
  });
});
