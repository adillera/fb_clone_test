# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#post-button').click (e) ->
    e.preventDefault()

    pb = $('#post-box')

    post = pb.val()

    $.ajax(
      type: "POST"
      url: "/posts"
      data: "post=" + post
      success: (resp) ->
        $("#posts-holder").prepend(
          "<div class='post'>
             <div>
               <div><strong>" + resp.user.email + "</strong></div>
               <div>" + resp.post.post + "</div>
             </div>

             <h5>Comments</h5>
             <div class='comments-holder'></div>

             <div>
               <div class='form-group'>
               <textarea class='form-control'></textarea>
             </div>

             <a href='#' class='btn btn-primary comment-button' data-main-post-id='" + resp.post.id + "'>Comment</a>
           </div>"
        )

        enableAllcommentButtons()
    )

    pb.val(null)

  enableAllcommentButtons = () ->
    $.each $(".comment-button"), (i, v) ->
      $(v).click (e) ->
        e.preventDefault()

        cb = $(v).siblings(".form-group").children("textarea")

        comment = cb.val()

        cholder = $(v).parent().siblings(".comments-holder")

        $.ajax(
          type: "POST"
          url: "/posts"
          data: "post=" + comment + "&main_post_id=" + $(v).attr("data-main-post-id")
          success: (resp) ->
            cholder.prepend(
              "<div><strong>" + resp.user.email + "</strong></div>
               <div>" + resp.post.post + "</div>"
            )
        )

        cb.val(null)

  enableAllcommentButtons()
