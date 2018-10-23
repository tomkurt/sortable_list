class SortableList
  constructor: (@list)->
    @tbody_el =     @list.find('tbody')
    @model =        @list.data('model')
    @tr_class =     @list.data('tr-class')
    @initialized =  @list.data('initialized')

  toggle: ->
    edit_mode = !@list.hasClass('edit_mode')
    @initialize_sortable_table() unless @initialized
    @tbody_el.sortable(if edit_mode then 'enable' else 'disable')
    @list.toggleClass('edit_mode', edit_mode);
    edit_mode

  initialize_sortable_table: ->
    @tbody_el.sortable stop: @sorted
    @add_drag_icon_column()
    @list.data('initialized', true)

  add_drag_icon_column: ->
    @list.find('thead tr:first').prepend('<th class="orderHandle"></th>')
    $.each @list.find('tbody tr'), ->
      $(this).prepend('<td class="fit orderHandle"><i class="fa fa-arrows"></i></td>')
    $('.orderHandle').addClass(@tr_class) if @tr_class

  sorted: =>
    ids = []
    @tbody_el.find('tr').each ->
      ids.push $(this).data('id')

    $.post "/sortable_lists/reorder", ids: ids, model: @model, _method: 'PUT'

$ ->
  $('[data-sortable-list-toggle]').click (e) ->
    e.preventDefault()
    list = $($(this).data('sortable-list-toggle'))
    sortable_list = new SortableList(list)
    edit_mode = sortable_list.toggle();
    $(this).html('<i class="fa fa-sort"></i> ' + if edit_mode then "Stop sorteren" else "Sorteer")
