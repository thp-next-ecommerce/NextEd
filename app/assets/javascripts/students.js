$(document).ready(
  function(){
    $('input:file').change(
      function(){
        if ($(this).val()) {
          $('input:submit').attr('disabled',false);
        } 
      }
    );
  }
);
