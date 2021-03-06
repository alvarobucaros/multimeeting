var app = angular.module('app', []);
app.controller('mainController',['$scope','$http', function($scope,$http){
    $scope.form_title = 'Documentos anexados al acta';
    $scope.form_btnNuevo = 'Nuevo registro';
    $scope.form_btnEdita = 'Edita';
    $scope.form_btnElimina = 'Elimina';
    $scope.form_btnAnula = 'Cerrar';
    $scope.form_btnActualiza = 'Actualizar';
    $scope.form_titModal = 'Actualiza lista de registros';
    $scope.form_Phbusca = 'Consulta';
    $scope.form_btnCarga = 'Cargarlo';

    $scope.form_anexos_id = 'ID';
    $scope.form_agenda_comiteId = 'COMITE';
    $scope.form_anexos_acta_id = 'ACTA';
    $scope.form_anexos_anexo = 'ANEXO';
    $scope.form_anexos_descripcion = 'DESCRIPCION';

    $scope.form_Phanexos_id = 'Digite id';
    $scope.form_Phanexos_comiteid = 'Digite comiteid';
    $scope.form_Phanexos_agendaid = 'Digite agendaid';
    $scope.form_Phanexos_anexo = 'Digite anexo';
    $scope.form_Phanexos_descripcion = 'Digite descripcion del anexo a cargar';
    $scope.form_btnRecarga = 'Recarga lista';
    $scope.CargaDocumento = 'Carga Documento';
    $scope.registro = {};
    $scope.agendaId = 0;
    $scope.comiteId = 0;
    $scope.empresa = $('#e').val();
    $scope.ruedita = false; 
    $scope.btnCarga = true;
    $scope.btnActualiza=false;
    $scope.btnReCarga = false;
    $scope.registro.dibujo= "C";
    
    getCombos();
    
    getInfo();
    
    function getInfo(){
        $scope.datosOcultos = false;
    }

    function getCombos(){
        var user = $('#u').val();
        empresa=$scope.empresa = $('#e').val(); 
        $http.post('modulos/mod_mm_agendaanexos.php?op=0',{'op':'0','empresa':empresa,'user': user}).success(function(data){
            $scope.operators0 = data;
        });
    } 
    
   $scope.updateComite = function(){
       empresa=$scope.empresa = $('#e').val();
       $scope.comiteId = $scope.registro.agenda_comiteId;
       $scope.registro.comiteId = $scope.comiteId;    
       $http.post('modulos/mod_mm_agendaanexos.php?op=1',{'op':'1','comite':$scope.comiteId, 'empresa':empresa}).success(function(data){
        $scope.operators1 = data;
        });      
    };
    
    $scope.comiteSeleccionado = function(){  
        $scope.btnActualiza=false;
        $scope.agendaId = $scope.registro.agenda_id;
        $scope.registro.actaId = $scope.agendaId;
        $http.post('modulos/mod_mm_agendaanexos.php?op=fch',{'op':'fch','agenda':$scope.agendaId}).success(function(data){
        $scope.registro.anno = data;
        empresa = $scope.empresa;
        $http.post('modulos/mod_mm_agendaanexos.php?op=r',{'op':'r','empresa':empresa, 'comite':$scope.comiteId, 'agenda':$scope.agendaId}).success(function(data){          
        alert(data);
            $scope.details = data;
        }); 
        leeAnexos($scope.comiteId, $scope.agendaId);
        });    
    };
 
    function leeAnexos(comite, agenda){
        empresa = $scope.empresa;
        comite = $scope.comiteId; 
        agenda = $scope.agendaId;
        $http.post('modulos/mod_mm_agendaanexos.php?op=r',{'op':'r','empresa':empresa, 'comite':comite, 'agenda':agenda}).success(function(data){          
        $scope.details = data;
        });  
    }
 
//    function actualiza(id, comiteid, agendaid , anexo, descripcion, empresa){  
//        $http.post('modulos/mod_mm_agendaanexos.php?op=a',{'op':'a', 'anexos_id':id, 'anexos_comiteid':comiteid, 'anexos_agendaid':agendaid, 
//            'anexos_anexo':anexo, 'anexos_descripcion':descripcion, 'anexos_empresa':empresa}).success(function(data){
//        if (data === 'Ok') {
//            leeAnexos($scope.comiteId, $scope.agendaId);
//            $scope.anexos_descripcion='';
//        }
//        });
//     };
 
     $scope.botonOk = function(){
        $scope.btnCarga = true;
        $scope.ruedita = true;
     };
     
     $scope.recarga = function(){
        $scope.btnActualiza=true;
        leeAnexos($scope.comiteId, $scope.agendaId);
     };
 
     $scope.actualizaLista = function(){
        $('#btnReCarga').hide();
        $('#message').val('');
        leeAnexos($scope.comiteId, $scope.agendaId)
     };
     
    $scope.leeDatosComite = function(registro){
        $scope.comiteId = registro.agenda_id;
        alert('leer datos de '.$scope.comiteId);
    };
 
$scope.show_form = true;
// Function to add toggle behaviour to form
$scope.formToggle =function(){
$('#idForm').slideToggle();
//$scope.registro = '';
$scope.anexos_id=0;
$('#idForm').css('display', 'none');
};

    $scope.show_form = true;
    // Function to add toggle behaviour to form
    $scope.formToggle =function(){
    $('#idForm').slideToggle();
            $scope.formato.$setPristine();
            $scope.registro = angular.copy(defaultForm);
    };

    $scope.verPdf = function(info){
//        var pth = location.pathname;
//        alert (pth);
//        pdf = info.anexos_ruta;
//        pdf='../../actas/E00002/2019/comite4/acta29/LATAM-Abril 17.pdf';
//        window.open(pdf);
        
//        $http.post('modulos/mod_mm_agendaanexos.php?op=pr',{'op':'pr','pdf':pdf}).success(function(data){          
//        $scope.details = data; 
//        });        
//        
    }
    
    $scope.deleteInfo =function(info)
    { 
        if (confirm('Desea borrar el registro con nombre : '+info.anexos_anexo+' ?')) { 
            comite = info.anexos_comiteid;
            agenda=info.anexos_agendaid;         
            $http.post('modulos/mod_mm_agendaanexos.php?op=b',{'op':'b', 'anexos_id':info.anexos_id}).success(function(data){
            if (data === 'Ok') {               
                msg='Registro Borrado ';
            }else{
                msg='El archivo físico ya no existe en la carpeta ';
            }
            leeAnexos($scope.comiteId, $scope.agendaId)
            });
         }
    };
}]);
	 
// >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Tuesday,Jan 23, 2018 5:18:20   <<<<<<< 
