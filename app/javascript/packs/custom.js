$(function() {
    $('a[id^="DONE_"]').on("click",function(){
        var data = $(this).attr('id');
        var donedata = $(this).attr('info');
        var iddata = data.replace('DONE_');
        $("#tr_"+ iddata).hide('slow');
        alert();
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