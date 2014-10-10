App.factory 'Repo', ['$resource', ($resource) ->
  $resource '/repos/:id', {id: '@id'},
    enable:
      method: 'POST', url: 'repos/:id/activation'
    disable:
      method: 'POST', url: 'repos/:id/deactivation'
]
