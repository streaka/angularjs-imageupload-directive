angular.module('imageuploadDemo', ['imageupload'])
  .controller('new-scope',function(){})
  .controller('DemoCtrl', function($scope, $http) {

    $scope.single = function(image) {
      var formData = new FormData();
      formData.append('image', image, image.name);

      $http.post('upload', formData, {
        headers: { 'Content-Type': undefined },
        transformRequest: angular.identity
      }).success(function(result) {
        $scope.uploadedImgSrc = result.src;
        $scope.sizeInBytes = result.size;
      });
    };

  });
