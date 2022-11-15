$(document).ready(function() {
    $("#quantity").on("click",function() {
        $.ajax({
            url:"/cart/update_quantity",
            method: "post",
            data: {"quantity_id":$(this).val()} ,
            dataType: "json",
            success: function(data) {
                alert('successfully');
              }
            
        }) 
      
    });
});