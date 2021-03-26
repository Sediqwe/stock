$(function() {
    $('a[id^="DONE_"]').on("click",function(){
        var data = $(this).attr('name');
        var donedata = $(this).attr('info');
        var iddata = data.replace('DONE_');

        $.ajax({
            url: "/donetwo",
            type: "POST",
            data: { image: { id: iddata, done: donedata} },
            success: function(data) {
                $("#tr_"+ iddata).hide('slow');
            },
            error: function(data) {
                $("#tr_"+ iddata).hide('slow');
                $("#tr_"+ iddata).show('slow');

            }
          })
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