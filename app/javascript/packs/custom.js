$(document).on('turbolinks:load', function() {
  
  $(document).on('click', 'button[id^="szuperdolog_"]', function(){
    var data = $(this).attr('data-elso');
    var textarea = $('textarea#comment_idea').val();
    $('textarea#comment_idea').val(textarea +"\n" +  "http://gtav.forditas.xyz/index.php?m=forditas&s=" +data);
    $("div#adatok").html("Adatok");
    $("#search_hun").val("");
    $("#search_eng").val("");
  });

  


  $("#search_eng").on( "keypress", function (e) {
    var data = $(this).val();
    if (e.which == 13) {
              $.ajax({
                type: "POST",
                url: "/api/",
                data: "type=eredeti&s=" + data,
                success: function (data) {
                   $("div#adatok").html(data);
                },
            });
      }
});
$("#search_hun").keypress(function (e) {
  var data = $(this).val();
  if (e.which == 13) {
            $.ajax({
              type: "POST",
              url: "/api/",
              data: "type=forditas&s=" + data,
              success: function (data) {
                 $("div#adatok").html(data);
              },
          });
    }
});
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
              $("#SAVE_"+ id).removeClass('bg-success').addClass('bg-secondary').html("Elmentve");
              
              setTimeout(
                function() 
                {
                  $("#SAVE_"+ id).hide( "slow" );
                  $("#SAVE_"+ id).addClass('bg-success').removeClass(" bg-secondary").html("Elmentve");
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

        var y = $(this).val();
        $.ajax({
          url: "/urlke",
          type: "POST",
          data: { product: { id: window.location.href} },
          success: function(data) {
              //alert("OK ->" + data.id + "-> " + data.file + "-> " + data.page);
              window.location.href = data.host + "?id=" + data.id  + "&file=" +  y;
              
          },
          error: function(data) {
              //alert("ERROR " + data.valami);
              }
            })


        
        
        
        
      });
      
      $('select#oszlop_id_').on('change', function() {
        var y = $(this).val();
        $.ajax({
          url: "/urlke",
          type: "POST",
          data: { product: { id: window.location.href} },
          success: function(data) {
              //alert("OK ->" + data.id + "-> " + data.file + "-> " + data.page);
              window.location.href = data.host + "?id=" + data.id  + "&file=" +  data.file + "&col=" + y;
              
          },
          error: function(data) {
              //alert("ERROR " + data.valami);
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
        var adat = $(this).attr('data-adat');
        var data = $("#trans_"+ id).val();
          $("#new_"+ adat).val(data);        
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
                //$("#tr_"+ id).hide("slow");
                
            },
            error: function(data) {
                //alert("ERROR " + data.valami);
                $("#tr_"+ id).addClass('bg-warning');
                
  
            }
          })       
        }) 
        $('[data-toggle="tooltip"]').tooltip()
  });

 