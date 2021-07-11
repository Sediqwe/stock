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
    //Translate oldalon menti el az új fordítást!!
    $('div[id^="SAVE_"]').on("click",function(){
      
      var id = $(this).attr('id').replace('SAVE_','');
      var data = $("#new_"+ id).val();
     
      $.ajax({
          url: "/translate",
          type: "POST",
          data: { product: { id: id, data: data} },
          success: function(data) {
              //alert("OK ->" + data.valami);
              $("#tr_"+ id).addClass('bg-success');
          },
          error: function(data) {
              //alert("ERROR " + data.valami);
              $("#tr_"+ id).addClass('bg-warning');
          }
        })
      
    
  });  
      //Átmásolja a fordításba a vezérlőt, de csak azt!
      $('button#only').on("click",function(){
        var id = $(this).attr('name');
        var text = $("#old_"+ id).val();
        var kezdet = 0;
        var kovetkezo = 10;
        for (i = 0; i < text.length; i++) {
            if (text[i] == "~") {
                if (kezdet == 0) {
                    kezdet = 1;
                } else {
                    kezdet = 0;
                }
                if (kezdet == 1) {
                    ideiglenes_text = text.substr(i + 1, text.length - i);
                    kovetkezo = ideiglenes_text.indexOf("~");
                    temp = i + kovetkezo;
                    $("#new_"+ id).val(
                        $("#new_"+ id).val() +
                        "~" +
                        ideiglenes_text.substr(0, kovetkezo) +
                        "~ "
                    );
                }
            }
        }

      })
      //Átmásolja az egész eredetit
      $('button#copy_original').on("click",function(){
        var id = $(this).attr('name');
        var data = $("#old_"+ id).val();
        $("#new_"+ id).val(data);
      })  
        //statusz_4 re dobja a dolgokat
        $('button#status_4').on("click",function(){
          var id = $(this).attr('name');
          var data = $("#old_"+ id).val();
          $("#new_"+ id).val(data);
        }) 
  });

 