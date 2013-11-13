EmberOnRailsTest.PostsController = Ember.ArrayController.extend
  actions:
    createPost: ->
      # Get the post title set by the "New post" text fields
      title = @get('newTitle') || ''
      body = @get('newBody') || ''

      # Create the new post model
      post = @store.createRecord 'post',
        title: title,
        body: body

      # Save the new model
      post.save().then (=>
        @set "errors", false
        # Clear the "New post" text fields
        @set 'newTitle', ''
        @set 'newBody', ''
        @transitionToRoute('post', post);
      ), (result)=>
        post.deleteRecord()
        if result.status == 422
          errors = jQuery.parseJSON(result.responseText).errors
          @set "errors", errors
        else
          console.log "An error occured during validation " + result.responseText
          alert "An error occured - REST API not available - Please try again"