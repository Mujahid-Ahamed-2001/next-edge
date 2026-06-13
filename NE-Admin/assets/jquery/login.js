$(document).ready(function(){
  $("#showPW").on("click", function(){
    if($(this).is(":checked"))
    {
      $("#password").attr("type","text")
    }
    else
    {
      $("#password").attr("type","password")
    }
  });
  $("#login-form").on("submit", function(e){
    e.preventDefault();
    console.log("Submition");
    var formData = $(this).serialize();
    var btnHtml = $("#btn-sign").html();
    $.ajax({
        url: "./API/login",
        type: "POST",
        data:formData,
        dataType: "json",

        beforeSend: function(){
            $(".send-btn").prop("disabled", true).html("Please Wait...");
        },

        success: function(response){

            $(".send-btn").prop("disabled", false).html(btnHtml);

            if(response.status == "success")
            {
              iziToast.success({
                  title: 'Success',
                  message: response.message,
                  position: 'topRight'
              });

              setTimeout(function() {
                  window.location.href = "./dashboard.php";
              }, 1500);
            }
            else
            {
            
              iziToast.error({
                  title: 'error',
                  message: response.message,
                  position: 'topRight'
              });
            }
        },

        error: function(xhr, status, error){
            console.log("AJAX Error:", status, error);
            console.log("Response:", xhr.responseText);
            
              iziToast.error({
                  title: 'error',
                  message: 'Oops! Something went wrong.',
                  position: 'topRight'
              });
            $(".send-btn").prop("disabled", false).html(btnHtml);
        }
    });
    
  })
});