EmberOnRailsTest.PostsController = Ember.ArrayController.extend
  actions:
    createPost: ->
      # Get the post title set by the "New post" text fields
      title = @get('newTitle')
      body = @get('newBody')
      return if !title || !body

      # Create the new post model
      post = @store.createRecord 'post',
        title: title,
        body: body,
        isCompleted: false

      # Clear the "New post" text fields
      @set 'newTitle', ''
      @set 'newBody', ''

      # Save the new model
      post.save()