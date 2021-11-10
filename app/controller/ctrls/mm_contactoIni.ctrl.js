var app = angular.module('app', []);
app.controller('mainController',['$scope','$http', function($scope,$http){
    $scope.form_title = 'Contactáctenos';   
    $scope.form_subtitle = 'Comuníquenos sus apreciaciones, inquietudes o incidencias';   
    $scope.form_btnEnvia = 'Enviar';
    $scope.form_btnBorra = 'Limpiar';
    $scope.form_mnu1 = 'Otros Productos';
    $scope.form_mnu0='MutiMeeting';
    
    $scope.tit01='Sistema para programación, control y seguimiento de reuniones';
    $scope.tit02='Para ingresar y probar la aplicación emplee';
    $scope.tit03='Usuario para pruebas : admin@com.co Contraseña: Admin123';
    $scope.tit04='Con este sistema se puede llevar múltiples reuniones en: comités, juntas, contratos proyectos o cualquier tipo de reunión que amerite tener un seguimiento con su respectiva acta o minuta.';
    $scope.tit04a='Cree una relación se los sitios donde se hace su reunión junto con una relación de sus comités, seleccione uno de estos e ';
    $scope.tit05='incluya la lista de asistentes, selecione el salón donde esta se ha de llevar a cabo, haga la preparación de los temas a tratar junto con los pendientes de reuniones anteriores, adicione los asistente o invitados especiales, una vez configurado esto, envie la invitación junto con el temario vía correo electrónico y/o mensaje de texto al celular usando la opicón del menú';
    $scope.tit06='Durante el desarrollo de la reunión haga las anotaciones pertinentes a cada tema tratado, a medida que se  hace este trabajo la aplicación va creando el acta o minuta, así, al final se puede revisar y aprobarla, se imprime se firma por los asistentes y se carga por medio de la opción de administración de contenidos junto con los documentos soportes de la reunión tales como: contratos, cotizaciones, cuadros u otro documento soporte, de tal manera que puedan ser consultados por todos';
    $scope.tit07='Con el asistente de seguimiento se puede hacer consulta a las actas o minutas de la reunión y los documentos soporte, realizar consultas temáticas y  el rastreo a las tareas que se han dejado pendientes para analizar su avance.';
    $scope.tit08='El sistema es seguro pues solo las personas autorizadas pueden acceder a la reunión que se les de este privilegio.';
    $scope.tit09='Por ser un ambiente de trabajo tipo WEB, la información estará disponible en cualquier sitio utilizando cualquier navegador, este es un sistema habilitado para ser utilizado en computadores o en dispositivos móviles.';
    $scope.tit10='Precio: La aplicación es de uso libre, Usted puede hacer su donación para recibir notificaciones sobre cambios y ajustes o bien para poder solicitar los ajustes que Ud considere que puede ayudar a enriquecer este producto. ';
    $scope.tit11='Si desea usar nuestro servidor WEB, tenemos un contrato de renta por un plazo mayor o igual a seis(6) meses con una inversión mensual de un dólar (US$ 1), en Colombia cuatro mil pesos($ 4.000); este valor incluye: el alquiler del servidor WEB, actualizaciones de la APP, alojamiento de actas y sus documentos y copias de seguridad diarias ';						
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

