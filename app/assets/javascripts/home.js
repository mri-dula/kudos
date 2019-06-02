$(document).ready(function() {

    function formatState (employee) {
      if (!employee.id) {
        return employee.text;
      }
      var $employee = $(
        '<span><img src="assets/user-dummy" style="width: 40px;" />' + employee.text + '</span>'
      );
      return $employee;
    };
    
    $("#kudo_to_id").select2({
      templateResult: formatState,
      placeholder: ''
    });
})