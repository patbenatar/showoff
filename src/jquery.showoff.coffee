$ = jQuery

$.fn.extend
  showoff: (options) ->
    $(@).each ->
      new Showoff($(@), options)
