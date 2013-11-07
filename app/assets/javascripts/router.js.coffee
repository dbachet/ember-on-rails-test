# For more information see: http://emberjs.com/guides/routing/

EmberOnRailsTest.Router.map ->
  @resource "posts", ->
    @resource "post",
      path: ":post_id"