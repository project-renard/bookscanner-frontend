# this needs to be done first before any templates are evaluated
require ["underscore"], (_) ->
  # use {{ template delimiters }}
  _.templateSettings  =
    evaluate    : /\{{([\s\S]+?)\}\}/g
    interpolate : /\{\{=([\s\S]+?)\}\}/g
    escape      : /\{\{-([\s\S]+?)\}\}/g

define ["backbone"
  "cs!app/view/projectview",
  "cs!app/collection/project",
  "module",
  ],
  (Backbone, ProjectView, Project, module) ->
    class app
      constructor: ->
        collection = new Project [],
          url: module.config().url
        new ProjectView
          collection: collection
