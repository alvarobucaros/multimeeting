


$(document).ready(function (e) {
    $("#uploadimage").on('submit',(function(e) {
    e.preventDefault();
    $("#message").empty();
    //$('#loading').show();
    emp= $('#e').val().trim();
    usu= $('#u').val();
    com = $('#anexos_id').val();
    acta= $('#actaId').val();
    desc= $('#anexos_descripcion').val();
    anno= $('#anno').val();
    dibujo = $('#dibujo').val();
    ctrl= $('#control').val();
    if(dibujo !=='C'){
        anno = new Date().getFullYear();
        desc = 'Logo o avatar';
        acta='0';
        com='0';
        ctrl='';
    }
    pas=emp+'||'+com+'||'+acta+'||'+anno+'||'+desc+'||'+usu+'||'+dibujo;
    //alert (pas);
    if(ctrl===''){
        $.ajax({
            url: "modulos/ajax_php_file.php?pas="+pas, // Url to which the request is send
            type: "POST",             // Type of request to be send, called as method
            data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
            contentType: false,       // The content type used when sending data to the server.
            cache: false,             // To unable request pages to be cached
            processData:false,        // To send DOMDocument or non processed data file it is set to false
            success: function(data)   // A function to be called if request succeeds
            {
                $("#message").html(data);
                $('#btnReCarga').show();
                $('#divOcultos').show();
                $('#divRuedita').hide();
                $('#control').val('SI');   

            }
        });
    }
    $('#control').val('');
    $('#anexos_descripcion').val('');
    }));

// Function to preview image after validation
$(function() {
$("#file").change(function() {
$("#message").empty(); // To remove the previous error message
dibujo = $('#Dibujo').val();

var file = this.files[0];
var imagefile = file.type;

var match= ["application/pdf","application/pdf"];
if (dibujo !== 'C'){var match= ["image/jpeg","image/png"];}
//if (dibujo === 'C'){var match= ["application/png","application/jpg"];}
if(!((imagefile===match[0]) || (imagefile===match[1])))
{
    err="Solo carga documentos PDF\nConvierta el documento a PDF";
    alert(err);
    return false;
}
else
{
    var reader = new FileReader();
    reader.onload = imageIsLoaded;
    reader.readAsDataURL(this.files[0]);
    emp= $('#e').val();
    usu= $('#u').val();
    com = $('#agenda_comiteId').val();
    acta= $('#agenda_acta').val();
    desc= $('#anexos_descripcion').val();
    anno= $('#anno').val();
    if (dibujo === 'C'){
        leeAnexos(com, acta);
    }
}
});
});
function imageIsLoaded(e) {
$("#file").css("color","green");
};

    function leeAnexos(comite, agenda){ 
         $('#btnReCarga').show();

    }
// 
   function actualiza(id, comiteid, agendaid , anexo, descripcion, empresa, anno){  

     };
});



