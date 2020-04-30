/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



angular.module('ui.bootstrap.demo', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);
angular.module('ui.bootstrap.demo').controller('ModalDemoCtrl', function ($uibModal, $log) {
  var app = this;
  app.data = "Lorem Name Test"; 

  app.open = function (size) {
    var modalInstance = $uibModal.open({
      animation: true,
      ariaLabelledBy: 'modal-title',
      ariaDescribedBy: 'modal-body',
      templateUrl: 'myModalContent.html',
      controller: 'ModalInstanceCtrl',
      controllerAs: 'app',
      size: size,
      resolve: {
        data: function () {
          return app.data;
        }
      }
    });

    modalInstance.result.then(function () {
      alert("now I'll close the modal");
    });
  };
});

angular.module('ui.bootstrap.demo').controller('ModalInstanceCtrl', function ($uibModalInstance, data) {
  var app = this;
  app.data = data;
  
  app.ok = function () {
    //{...}
    alert("You clicked the ok button."); 
    $uibModalInstance.close();
  };

  app.cancel = function () {
    //{...}
    alert("You clicked the cancel button."); 
    $uibModalInstance.dismiss('cancel');
  };
});
