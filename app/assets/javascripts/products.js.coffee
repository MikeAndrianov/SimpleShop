jQuery ->
  $('#company').change ->
    $.ajax
      url: '/products/get_factories'
      type: 'GET'
      dataType: 'script'
      data:
        company: $("#company").val()
  $("#product_img_src").keyup ->
    $.ajax
      url: '/products/get_image'
      type: 'GET'
      dataType: 'script'
      data:
        img_src: $("#product_img_src").val()
