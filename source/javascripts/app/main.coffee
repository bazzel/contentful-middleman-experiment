#= require ./blog-posts

Blog = new Marionette.Application()

Blog.Post = Backbone.Model.extend()

Blog.PostCollection = Backbone.Collection.extend
  model: Blog.Post

Blog.PostItemView = Marionette.ItemView.extend
  tagName: 'li'
  template: '#post-item'

Blog.PostsView = Marionette.CollectionView.extend
  tagName: 'ul'
  childView: Blog.PostItemView

Blog.addRegions
  mainRegion: '#main-content'

Blog.on 'start', ->
  posts = new Blog.PostCollection(blogData)
  postsListView = new Blog.PostsView
    collection: posts
  Blog.mainRegion.show(postsListView)

$ ->
  Blog.start()

