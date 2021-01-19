var app = angular.module('app', []);
app.controller('mainController',['$scope','$http', function($scope,$http){
    $scope.form_title = 'Control de pendientes';
    $scope.form_btnNuevo = 'Anotación';
    $scope.form_btnEdita = 'Edita';
    $scope.form_btnElimina = 'Elimina';
    $scope.form_btnAnula = 'Cerrar';
    $scope.form_btnExcel = 'Exporta Excel';
    $scope.form_btnActualiza = 'Actualizar';
    $scope.form_titModal = 'Actualiza lista de registros';
    $scope.form_Phbusca = 'Consulta';
 
    $scope.form_pendiente_estado80 = 'Cumplido';
    $scope.form_pendiente_estado81 = 'Pendiente';

    $scope.form_pendiente_id = 'ID';
    $scope.form_pendiente_empresa = 'EMPRESA';
    $scope.form_pendiente_comite = 'COMITE';
    $scope.form_pendiente_agendaId = 'AGENDA';
    $scope.form_pendiente_tema = 'TEMA';
    $scope.form_pendiente_detalle = 'ANOTACION';
    $scope.form_pendiente_responsable = 'RESPONSABLE';
    $scope.form_pendiente_fecha = 'FECHA';
    $scope.form_pendiente_estado = 'ESTADO';

    $scope.form_Phpendiente_id = 'Digite id';
    $scope.form_Phpendiente_empresa = 'Digite empresa';
    $scope.form_Phpendiente_comite = 'Digite comite';
    $scope.form_Phpendiente_agendaId = 'Digite agendaid';
    $scope.form_Phpendiente_tema = 'Digite tema';
    $scope.form_Phpendiente_detalle = 'Digite detalle';
    $scope.form_Phpendiente_responsable = 'Digite responsable';
    $scope.form_Phpendiente_fecha = 'Digite fecha';
    $scope.form_Phpendiente_estado = 'Digite estado';
    $scope.form_anotacion = '';
     $scope.currentPage = 0;
     $scope.pageSize = 10;
     $scope.pages = [];
     $scope.registro = [];
     $scope.empresa = $('#e').val();
     var defaultForm= {
   
        pendiente_id:0,
        pendiente_empresa:$scope.empresa,
        pendiente_comite:0,
        pendiente_agendaId:0,
        pendiente_tema:0,
        pendiente_detalle:'',
        pendiente_responsable:'',
        pendiente_fecha:'',
        pendiente_estado:'P'
   };
    
    getCombos($scope.empresa);
    
    getInfo($scope.empresa);
    
    function getInfo(empresa){
         var user = $('#u').val();
        $http.post('modulos/mod_mm_agendapendientes.php?op=r',{'op':'r', 'empresa':empresa, 'user': user}).success(function(data){
        $scope.details = data;
        $scope.configPages();   
        });       
    }

    function getCombos(empresa){
         var user = $('#u').val();
         $http.post('modulos/mod_mm_agendapendientes.php?op=0',{'op':'0', 'empresa':empresa, 'user': user}).success(function(data){
         $scope.operators0 = data;
         });
} 
 
    $scope.buscaAgenda = function(){
        comite=$scope.registro.pendiente_comite;
        empresa = $scope.empresa;
        $http.post('modulos/mod_mm_agendapendientes.php?op=1',{'op':'1', 'empresa':empresa,'comite':comite}).success(function(data){
        $scope.operators1 = data;
        });
    };
    
    $scope.buscaTemas = function(){
        comite = $scope.registro.pendiente_comite;
        agenda = $scope.registro.pendiente_agendaId
        empresa = $scope.empresa;
        $http.post('modulos/mod_mm_agendapendientes.php?op=2',{'op':'2', 'empresa':empresa, 'agenda':agenda, 'comite':comite}).success(function(data){
            $scope.operators2 = data;
        });
    };
    
    $scope.configPages = function() {
        $scope.pages.length = 0;
        var ini = $scope.currentPage - 4;
        var fin = $scope.currentPage + 5;
        if (ini < 1) {
            ini = 1;
            if (Math.ceil($scope.details.length / $scope.pageSize) > 10)
                fin = 10;
            else
                fin = Math.ceil($scope.details.length / $scope.pageSize);
        }
        else {
            if (ini >= Math.ceil($scope.details.length / $scope.pageSize) - 10) {
                ini = Math.ceil($scope.details.length / $scope.pageSize) - 10;
                fin = Math.ceil($scope.details.length / $scope.pageSize);
            }
        }
        if (ini < 1) ini = 1;
        for (var i = ini; i <= fin; i++) {
            $scope.pages.push({no: i});
        }

        if ($scope.currentPage >= $scope.pages.length)
            $scope.currentPage = $scope.pages.length - 1;
    };

    $scope.setPage = function(index) {
        $scope.currentPage = index - 1;
    };

 
// Function to add toggle behaviour to form
$scope.formToggle =function(){
$('#idForm').slideToggle();
$scope.pendiente_id=0;
$('#idForm').css('display', 'none');

};

$scope.show_form = true;
// Function to add toggle behaviour to form
$scope.formToggle =function(){
$('#idForm').slideToggle();
        $scope.formato.$setPristine();
        $scope.registro = angular.copy(defaultForm);

};

    
    $scope.editInfo =function(info)
    {  
        $scope.form_anotacion = ' COMITE: '+info.comite_nombre+', '+info.agenda_Descripcion+', TEMA:'+info.tema_titulo;
        $scope.registro =  info;  
        $scope.registro.pendiente_detalle='';
        $('#idForm').slideToggle();

    };

$scope.exporta = function(){
    valor = confirm('Exporta la tabla de inmuebles y propietarios a Excel, continua?');
   if (valor == true) {
        empresa = $('#e').val();
        $http.post('modulos/mod_mm_agendapendientes.php?op=exp',{'op':'exp','empresa':empresa}).success(function(data){
       $('#miExcel').html(data); 
        alert('exporta a Excel. Cargue y renombre el documento... ');
        window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('#miExcel').html()));
    }); 
   }  
}
    $scope.deleteInfo =function(info)
    { 
        empresa = $('\#e').val(); 
        if (confirm('Desea borrar el registro con nombre : '+info.pendiente_comite+' ?')) {  
            $http.post('modulos/mod_mm_agendapendientes.php?op=b',{'op':'b', 'pendiente_id':info.pendiente_id}).success(function(data){
            if (data === 'Ok') {
            getInfo(empresa);
            alert ('Registro Borrado ');
            }
            });
         }
    };

    $scope.updateInfo =function(info)
    {
        er='';
        info.pendiente_id=0;
        empresa = $('\#e').val(); 
        if($('#pendiente_id').val()===''){er+='falta id\n';}
        if($('#pendiente_empresa').val()===''){er+='falta empresa\n';}
        if($('#pendiente_comite').val()===''){er+='falta comite\n';}
        if($('#pendiente_agendaId').val()===''){er+='falta agendaid\n';}
        if($('#pendiente_tema').val()===''){er+='falta tema\n';}
        if($('#pendiente_detalle').val()===''){er+='falta detalle\n';}
        if($('#pendiente_responsable').val()===''){er+='falta responsable\n';}
        if($('#pendiente_fecha').val()===''){er+='falta fecha\n';}
        if($('#pendiente_estado').val()===''){er+='falta estado\n';}
        if (er==''){
        $http.post('modulos/mod_mm_agendapendientes.php?op=a',{'op':'a', 'pendiente_id':info.pendiente_id, 'pendiente_empresa':info.pendiente_empresa, 'pendiente_comite':info.pendiente_comite, 'pendiente_agendaId':info.pendiente_agendaId, 'pendiente_tema':info.pendiente_tema, 'pendiente_detalle':info.pendiente_detalle, 'pendiente_responsable':info.pendiente_responsable, 'pendiente_fecha':info.pendiente_fecha, 'pendiente_estado':info.pendiente_estado}).success(function(data){
        if (data === 'Ok') {
            getInfo(empresa);
            alert ('Registro Actualizado ');
            $('#idForm').slideToggle();
        }
        });
   }else{alert (er);}  
    };
    
    $scope.clearInfo =function(info)
    {
        console.log('empty');
        $('#idForm').slideToggle();
    };

}]);
	 

   app.filter('startFromGrid', function() {
         return function(input, start) {
             start =+ start;
             return input.slice(start);
         };
     });  
	 
// >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Monday,May 18, 2020 11:21:29   <<<<<<< 
