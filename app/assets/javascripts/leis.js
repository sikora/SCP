$("#cargo_lei_id").ajaxChosen({
  method: 'GET',
  url: '/leis.json',
  dataType: 'json',
}, function (data) {
  var terms = {};

  $.each(data, function (i, val) {
    terms[val.id] = val.descricao;
  });

  return terms;
});

$(".chozen_leis").ajaxChosen({
  method: 'GET',
  url: '/leis.json',
  dataType: 'json',
}, function (data) {
  var terms = {};

  $.each(data, function (i, val) {
    terms[val.id] = val.descricao;
  });

  return terms;
});
