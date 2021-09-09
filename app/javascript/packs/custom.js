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
    $('button[id^="SAVE_"]').on("click",function(){
      
      var id = $(this).attr('id').replace('SAVE_','');
      var data = $("#new_"+ id).val();
      if(data.length>3){
      $.ajax({
          url: "/translate",
          type: "POST",
          data: { product: { id: id, data: data} },
          success: function(data) {
             // alert("OK ->" + data.valami);
              $("#tr_"+ id).addClass('bg-success');
              $("#SAVE_"+ id).removeClass('bg-success').addClass('bg-warning').html("Elmentve");
              
              setTimeout(
                function() 
                {
                  $("#tr_"+ id).removeClass('bg-success').hide( "slow" );
                  $("#SAVE_"+ id).addClass('bg-success').removeClass("bg-warning").html("Mentés");
                }, 2000);
          },
          error: function(data) {
              //alert("ERROR " + data.valami);
              $("#tr_"+ id).addClass('bg-warning');

          }
        })
      }
      else{
        
        $("#new_"+ id).addClass('bg-warning');
        setTimeout(
          function() 
          {
            $("#new_"+ id).removeClass('bg-warning');
          }, 2000);
      }
    
      });
      $('select#file_id_').on('change', function() {
        endre = window.location.href.indexOf("&file")
        if(endre>0){
        end = window.location.href.substring(0,endre)
        }
        else{
          end = window.location.href
        }
        window.location.href = end + "&file=" + this.value;
        
        
      });

      $('select#oszlop_id_').on('change', function() {
        endre = window.location.href.indexOf("&col")
        if(endre>0){
        end = window.location.href.substring(0,endre)
        }
        else{
          end = window.location.href
        }
        window.location.href = end + "&col=" + this.value;
        
        
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
      //Beszurja a vezérlőket
      $('button#vez').on("click",function(){
        var id = $(this).attr('name');
        var adat = $(this).attr('data-adat');
        var data = $("#new_"+ id).val();
        $("#new_"+ id).val(data+ "~" +adat+ "~" );

      }) 
      //Átmásolja az egész eredetit
      $('button#copy_original').on("click",function(){
        var id = $(this).attr('name');
        var data = $("#old_"+ id).val();
        $("#new_"+ id).val(data);

      }) 
      //Elfogadom a fordítást
      $('button#ok').on("click",function(){
        var id = $(this).attr('name');
        var ter = $(this).attr('data-adat');
        var data = $("#old_"+ id).val();
        $.ajax({
          url: "/ok",
          type: "POST",
          data: { product: { id: id, data: data} },
          success: function(data) {
              //alert("OK ->" + data.valami);
              $("#tr_"+ ter).addClass('bg-success');
              
          },
          error: function(data) {
              //alert("ERROR " + data.valami);
              $("#tr_"+ ter).addClass('bg-warning');

          }
        })
        
      })  
      //Átmásolja az egész fordítást
      $('button#copy_translate').on("click",function(){
        var id = $(this).attr('name');
        var data = $("#trans_"+ id).val();
        $("#new_"+ id).val(data);        
      })  
        //statusz_4 re dobja a dolgokat
        $('button#status_4').on("click",function(){
          var id = $(this).attr('name');
          var data = $("#old_"+ id).val();
          $.ajax({
            url: "/nok",
            type: "POST",
            data: { product: { id: id, data: data} },
            success: function(data) {
                //alert("OK ->" + data.valami);
                $("span#"+ id).addClass('bg-danger');
                $("#tr_"+ id).hide("slow");
                
            },
            error: function(data) {
                //alert("ERROR " + data.valami);
                $("#tr_"+ id).addClass('bg-warning');
                
  
            }
          })       
        }) 
        $('[data-toggle="tooltip"]').tooltip()
  });

 