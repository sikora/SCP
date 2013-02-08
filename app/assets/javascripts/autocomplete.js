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
});