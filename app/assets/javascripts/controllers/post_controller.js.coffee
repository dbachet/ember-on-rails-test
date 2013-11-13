EmberOnRailsTest.PostController = Ember.ObjectController.extend
  actions:
    editPost: ->
      @set "isEditing", true

    cancelEditing: ->
      @set "isEditing", false
      @set "errors", false
      @get('model').rollback()

    acceptChanges: ->
      post = @get('model')
      post.save().then (=>
        @set 'isEditing', false
        @set "errors", false
        @transitionToRoute('post', post);
      ), (result)=>
        if result.status == 422
          errors = jQuery.parseJSON(result.responseText).errors
          @set "errors", errors
        else
          console.log "An error occured during validation " + result.responseText
          alert "An error occured - REST API not available - Please try again"

    removePost: ->
      @set 'isEditing', false
      @get('model').deleteRecord();
      @get('model').save()