$(document).on('turbolinks:load', function() {

    $('a[id^="DONE_"]').on("click",function(){
        var data = $(this).attr('name');
        var done = $(this).attr('info');
        $.ajax({
            url: "/donetwo",
            type: "POST",
            data: { product: { id: data, done: done} },
            success: function(data) {
              //  alert("OK" + data.valami);
            },
            error: function(data) {
                //alert("ERROR" + data.valami);

            }
          })
        $("#tr_"+ data).hide('slow');

    });

    $("#teszt").on("click",function(){
        
        $.ajax({
            url: "/je",
            type: "POST",
            data: { product: { name: "Filip", description: "whatever" } },
            success: function(data) {
                alert("OK" + data.valami);
            },
            error: function(data) {
                alert("ERROR" + data);

            }
          })
    });
    
  });

 