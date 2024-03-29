var app = angular.module('app', []);
app.controller('mainController',['$scope','$http', function($scope,$http, $modal){
    $scope.form_title = 'Actas de reunión';
    
    $scope.form_btnEdita = 'Edita';
    $scope.form_btnPrint = 'Imprime...';
    $scope.form_btnActualiza = 'Habilita';
    $scope.form_btnCierra = 'Cierra Acta';
    $scope.form_btnRegreso = 'Cancela';
    $scope.form_agenda_comiteId = 'COMITE';
    $scope.tituloFormulario='';
    $scope.printConAnexos=' Incluye anexos ';
    $scope.printSinAnexos=' Solo el acta ';
    $scope.titVentana='DESCARGA E IMPRIME ANEXOS SOPORTE';
    $scope.detail = {};
    
    $scope.empresa = $('#e').val();
    $scope.parametro = '';
    $scope.nota='';
    $scope.acta=0;
    $scope.agenda_id=0;
    $scope.formato = '';
    $scope.btnActualiza = true;
    
     $scope.modalShown = false;     
     
    var defaultForm= {
        agenda_comiteId:0
    };

         
    getCombos($scope.empresa);
    
    getInfo();
    
    $scope.show_form = true;


(function(){
var app=angular.module('app',[]);
  
app.controller('mainController', ['modalService',function(modalService){
  
  var vm=this;
  vm.result="";		// Default value for the result
  
  vm.openModal=function(){
    modalService
      .openModal()
      .then(function(data){
      	vm.result=data;
    });
  };
  
}]);
  
  app.controller('modalController',['modalService','$scope',function(modalService, $scope){
    var vm=this;
    vm.show=modalService.modalOn;		
    vm.returnValue=modalService.returnValue;	
    
    $scope.$on('MODAL_OPEN',function(){
      vm.show=modalService.modalOn;
    });
    
    $scope.$on('MODAL_CLOSE',function(){
      vm.show=modalService.modalOn;
    });
  }]);
  
  app.service('modalService',['$q','$rootScope',function($q,$rootScope){   
    
    var s=this;    		// Self reference
    
    // Attributes
    s.modalOn=false;	// Flag to indicate if the modal is on or off. Close by default
    
    s.openModal=function(){
      s.defer=$q.defer();										// We create a deferrer
      s.modalOn=true;												// Flag the showing of the modal
      $rootScope.$broadcast('MODAL_OPEN');	// Broadcast the message that the popup is open
      return s.defer.promise;								// Return a promise to the calling function
    };
    
    s.returnValue=function(value){
      
      s.modalOn=false;												// We flag the closing of the modal
      $rootScope.$broadcast('MODAL_CLOSE');		// Broadcast the event
      
      s.defer.resolve(value);									// Return the resolved value of the modal
    };
    
  }]);
})();


    $scope.formToggle =function(){
    $('#idForm').slideToggle();
        $scope.formato.$setPristine();
        $scope.registro = angular.copy(defaultForm);
    };
    
    function getInfo(){
       
    }

  $scope.toggleModal = function(detail) {
    $scope.modalShown = !$scope.modalShown;
    if($scope.modalShown){
        agenda = $scope.details[0].agenda_id
        empresa=$scope.empresa;
        $http.post('modulos/mod_mm_agendaanexos.php?op=pr',{'op':'pr','empresa':empresa,'agenda':agenda}).success(function(data){ 
        $scope.detailsAnex = data;
        });
    }
    
  };

    function getCombos(empresa){
        var user = $('#u').val();
         $http.post('modulos/mod_mm_agendamiento.php?op=1',{'op':'1','empresa':empresa,'user': user}).success(function(data){ 
         $scope.operators1 = data;
         });    
    }

    $scope.updateComite = function() { 
        traeAgendamientos();
    };    
    
    function traeAgendamientos(){
        comite=$scope.agenda_comiteId;
        empresa=$scope.empresa;
        $http.post('modulos/mod_mm_agendamiento.php?op=rc',{'op':'rc', 'comite_Id':comite,'empresa':empresa,'param':'excluye'}).success(function(data){       
            if(data != 'No Hay'){
                $scope.details = data;
        }else{
            $scope.details = null;
             alert('Este comité no tiene reuniones convocadas');
        }
         
       });
    }
    
    $scope.cierraActa = function(detail){
        agenda=$scope.agenda_id;        
        param=$scope.parametro;    
        aviso = 'Cierra acta ' + $scope.acta + ' ' + $scope.nota;     
        if (confirm(aviso+' continua?')) {  
            empresa=$scope.empresa;
            $http.post('modulos/mod_mm_agendamiento.php?op=cra',{'op':'cra','empresa':empresa,'agenda':agenda}).success(function(data){ 
            alert (data);
            $scope.btnActualiza = false;
            $scope.tituloFormulario='';
             });
        }
    };
    
    $scope.editInfo = function (detail){ 
        $scope.agenda_id =  detail.agenda_id;
        $scope.parametro = 'I';
        $scope.aviso='';
        $scope.nota=detail.agenda_Descripcion;
        $scope.acta=detail.agenda_acta;
        if(detail.agenda_cierraActa==='S'){$scope.aviso = "** ACTA CERRADA **";}
        $scope.tituloFormulario='Habilita ' + detail.agenda_Descripcion + ' para modificarla o enviar nuevamente la citación ';
        if (detail.agenda_observa.trim() === ''){
            $scope.parametro = 'A';
            var fecha = detail.agenda_fechaDesde.substr(0,10);
            $scope.tituloFormulario='Acta: ' + detail.agenda_acta + ' del ' + fecha + '\n' +detail.agenda_Descripcion  ;
        }
            $scope.showEdit = true;
            $scope.btnActualiza = true;
            if(detail.agenda_cierraActa==='S'){$scope.btnActualiza = false; }
    }; 
    
    $scope.anulaRegistro = function(){
        $scope.showEdit = false;
        $scope.btnActualiza = false;
        $scope.tituloFormulario='';
    };
    
    $scope.actualizaRegistro = function(detail){
        agenda=$scope.agenda_id;        
        param=$scope.parametro; 

        if (confirm('A esta acta se le podrá hacer modificaciones. Continua ?')) {

            $http.post('modulos/mod_mm_agendamiento.php?op=ha',{'op':'ha', 'agenda_id':agenda,'parametro':param}).success(function(data){
            if(data === 'Ok'){
                traeAgendamientos();
                alert('Comité habilitado. ');
                  $scope.btnActualiza = false;
                  $scope.tituloFormulario='';
            }
            else{
              alert(data);
            }
           }); 
       }
    };
    $scope.cierraVen = function(){
        $scope.modalShown = false;
    };
    
    $scope.printInfo = function(detail){ 
        desc = $scope.details[0].agenda_Descripcion;
        $scope.titVentana='IMPRIME ACTA '+ desc;
        agenda = $scope.details[0].agenda_id;
        tipo='A';
        empresa=$scope.empresa;
        $http.post('modulos/mod_mm_agendamiento.php?op=rfa',{'op':'rfa','empresa':empresa,'agenda':agenda}).success(function(data){ 
        $scope.formato = data; 
    
         });  
        location.href="reports/rpt_mm_actas.php?op="+agenda+"&em="+empresa+"&em="+empresa+"&frm="+$scope.formato+"&tp="+tipo;
        if(tipo==='C'){
            $http.post('modulos/mod_mm_agendaanexos.php?op=pr',{'op':'pr','empresa':empresa,'agenda':agenda}).success(function(data){ 
         }); 
        }
    }; 
    
    }]);
	 
// >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Tuesday,Jan 09, 2018 10:54:14   <<<<<<< 


