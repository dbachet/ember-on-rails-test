EmberOnRailsTest.PostController = Ember.ObjectController.extend
  actions:
    editPost: ->
      @set "isEditing", true

    cancelEditing: ->
      @set "isEditing", false

    acceptChanges: ->
      @set 'isEditing', false

      if Ember.isEmpty(@get('model.title'))
        @send('removePost')
      else
        @get('model').save()

    removePost: ->
      @set 'isEditing', false
      @get('model').deleteRecord();
      @get('model').save()