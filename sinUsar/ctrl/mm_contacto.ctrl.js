var app = angular.module('app', []);
app.controller('mainController',['$scope','$http', function($scope,$http){
    $scope.form_title = 'Contactáctenos';   
    $scope.form_subtitle = 'Comuníquenos sus apreciaciones, inquietudes o incidencias';   
    $scope.form_btnEnvia = 'Enviar';
    $scope.form_btnBorra = 'Limpiar';
    $scope.Nombre = 'Nombre';
    $scope.tema = 'Tema';
    $scope.celular = 'Celular';
    $scope.email='Email';
    $scope.mensaje='Mensaje';
    $scope.alinicio= 'Ir al Inicio';
    $scope.registroMail = {};
    $scope.retorno = false;
    
     $scope.sendMail = function(registroMail){
         dato= $scope.registroMail.nombre+'||'+$scope.registroMail.tema+'||'+$scope.registroMail.email+'||'+$scope.registroMail.celular+'||'+$scope.registroMail.message;
         $http.post('modulos/mod_mm_contacto.php?op=cnt',{'op':'cnt','dato':dato}).success(function(data){
         $scope.registroMail.retorno = data;
         $scope.registroMail = {};
         });          
         $scope.retorno = true;    
     };
       
    $scope.reset = function(){
        $scope.registroMail = {};
        
    };    
}]);

