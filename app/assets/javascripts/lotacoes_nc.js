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


var data = eval($('.data').val())
var theme = getTheme();

var source =
{
    datatype: "json",
    datafields: [
    { name: 'id' },
    { name: 'parent_id' },
    { name: 'descricao' }
    ],
    id: 'id',
    localdata: data
};



var button_novo = function(parent_id) {
    return  '<a href="/lotacoes/new/'+ parent_id + '" class="btn btn-mini btn-success"><i class="icon-plus icon-white"></i></a>';
};

var button_ver = function(id) {
    return '<a href="/lotacoes/'+ id +'" class="btn btn-mini btn-info"><i class="icon-zoom-in icon-white"></i></a>';
};
var button_editar = function(id) {
    return '<a href="/lotacoes/'+ id +'/edit""  class="btn btn-mini btn-warning"><i class="icon-pencil icon-white"></i></a>';
};

var button_remove = function(id) {
    return '<a href="/lotacoes/'+ id +'"" data-confirm="Deseja Apagar?" data-method="delete"  class= "btn btn-mini btn-danger" rel="nofollow"><i class="icon-trash icon-white"></i></a>';
};

// create data adapter.
var dataAdapter = new $.jqx.dataAdapter(source);
// perform Data Binding.
dataAdapter.dataBind();
// get the tree items. The first parameter is the item's id. The second parameter is the parent item's id. The 'items' parameter represents 
// the sub items collection name. Each jqxTree item has a 'label' property, but in the JSON data, we have a 'text' field. The last parameter 
// specifies the mapping between the 'text' and 'label' fields.  
var records = dataAdapter.getRecordsHierarchy('id', 'parent_id', 'items', [{ name: 'descricao', map: 'label'}]);
$('#jqxTree').jqxTree({ source: records, width: '100%', theme: theme });


$('#jqxTree').bind('select', function (event) {
    var htmlElement = event.args.element;
    var item = $('#jqxTree').jqxTree('getItem', htmlElement);
    var id = item.id;
    $('.actions_lotacao').remove();
    $('#'+ id + ' > div').after('<div class="actions_lotacao"> ' + button_novo(id) + button_ver(id) + button_editar(id) +button_remove(id)+ '</div>');

});