$ ->
  dataProvider = $('#good-provider')
  $('.destroy-good').on 'click', ->
    self = this
    $.ajax
      type: 'DELETE',
      url: dataProvider.attr('data-destroy-good-url'),
      data: { 'goods': {'plan_id' : $(self).attr('data-plan-id')}},
      dataType: 'JSON',
      success: (data) ->
        $(self).css('display','none')
        $(self).parent().find('.create-good').css('display','');

  $('.create-good').on 'click', ->
    self = this
    $.ajax
      type: 'POST',
      url: dataProvider.attr('data-create-good-url'),
      data: { 'goods': {'plan_id' : $(self).attr('data-plan-id')}},
      dataType: 'JSON',
      success: (data) ->
        $(self).css('display','none')
        $(self).parent().find('.destroy-good').css('display','');
