// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
  function validate_confirmation_password(){
    if(($("#user_password").val() == $("#confirmation").val()) && ($("#user_password").val() != "")){
      $.ajax({
        url: "/users/create",
        type: "POST"
      });
    }else{
      alert("Validation password error");
    }
  }


  function remove_user(confirmation,id){
    if(confirmation){
      $.ajax({
        url:"/users/"+id+"/destroy"
      });
    }
  }