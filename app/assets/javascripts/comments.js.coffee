 jQuery ->
      # Create a comment
      $(".comment-form")
        .on "ajax:beforeSend", (evt, xhr, settings) ->
          $(this).find('textarea')
            .addClass('uneditable-input')
            .attr('disabled', 'disabled');
        .on "ajax:success", (evt, data, status, xhr) ->
          $(this).find('textarea')
            .removeClass('uneditable-input')
            .removeAttr('disabled', 'disabled')
            .val('');
          $(xhr.responseText).hide().insertBefore($("#posts-container")).show('slow');
          
 jQuery ->
     $('.vote').click (e) ->
            e.preventDefault()
            vote = { "vote":"photo_id": $(this).attr("id")}
            clickedObj = $(this)
            $.ajax '/votes',
                type: 'POST'
                dataType: 'json'
                data: vote
                error: (jqXHR, textStatus, errorThrown) ->
              
                success: (data, textStatus, jqXHR) ->
                   clickedObj.toggleClass("on")
                   console.log  
                  