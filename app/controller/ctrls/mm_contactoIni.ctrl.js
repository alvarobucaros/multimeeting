var app = angular.module('app', []);
app.controller('mainController',['$scope','$http', function($scope,$http){
    $scope.form_title = 'Contactáctenos';   
    $scope.form_subtitle = 'Comuníquenos sus apreciaciones, inquietudes o incidencias';   
    $scope.form_btnEnvia = 'Enviar';
    $scope.form_btnBorra = 'Limpiar';
    $scope.form_mnu1 = 'Otros Productos';
    $scope.form_mnu0='Mutimeeting';
    
    $scope.tit01='Sistema para programación, control y seguimiento de reuniones';
    $scope.tit02='Para ingresar y probar la aplicación emplee';
    $scope.tit03='Usuario : admin@com.co Contraseña: admin123';
    $scope.tit04='Con este sistema se puede llevar múltiples reuniones tales como: comités, juntas, contratos o cualquier tipo de reunión que amerite tener un seguimiento con su respectiva acta.';
    $scope.tit05='Incluye asistentes para la programación de reuniones,  separación del salón donde se ha de llevar la reunión, preparación de los temas a tratar junto con los pendientes de reuniones anteriores,  agendamiento de asistente  e invitados especiales, a ellos  se les envía la notificación de invitación junto con  el temario vía correo electrónico y/o mensaje de texto al celular.';
    $scope.tit06='Durante el desarrollo de la reunión se puede llevar el acta de ésta, de tal manera que al final se puede revisar y aprobar, luego se imprime se firma por los asistentes y se carga por medio del asistente de administración de contenidos, todos los documentos soportes de la reunión tales como contratos, cotizaciones, cuadros, u otro documento de la reunión,  pueden ser digitalizados y cargados al sistema para luego ser consultados.';
    $scope.tit07='Con el asistente de seguimiento se puede hacer consulta a las actas, documentos digitalizados, realizar consultas temáticas y  el rastreo a las tareas que se han dejado para analizar su avance.';
    $scope.tit08='El sistema es seguro pues solo las personas autorizadas pueden acceder a la reunión que se les de este privilegio.';
    $scope.tit09='Por ser un ambiente de trabajo tipo WEB, la información estará disponible en cualquier sitio utilizando cualquier navegador, este es un sistema habilitado para ser utilizado en computadores o en dispositivos móviles.';
    $scope.tit10='Precio: La aplicación tiene un costo de ciento cincuenta dólares (US$150) o su equivalente en moneda nacional, en Colombia, quinientos mil pesos ($ 500.000). ';
    $scope.tit11='Si no posee un servidor WEB. puede utilizar la APP en nuestro sitio WEB con un cotrato de renta por un plazo mayor o igual a seis(6) meses con una inversión mensual de diez dólares($10), en Colombia treinta mil pesos($30.000); este valor incluye: el alquiler del servidor WEB, actualizaciones de la APP, alojamiento de actas y sus documentos y copias de seguridad diarias ';						
    $scope.tit12='';
    
    $scope.registroMail = {};
    $scope.retorno = false;
    
     $scope.sendMail = function(registroMail){
         dato= $scope.registroMail.nombre+'||'+$scope.registroMail.tema+'||'+$scope.registroMail.email+'||'+$scope.registroMail.celular+'||'+$scope.registroMail.message;
         $http.post('app/modulos/mod_mm_contacto.php?op=cnt',{'op':'cnt','dato':dato}).success(function(data){
         $scope.registroMail.retorno = data;
         });          
         $scope.retorno = true;    
     };     
    $scope.reset = function(){
        $scope.registroMail = {};     
    };    
}]);

