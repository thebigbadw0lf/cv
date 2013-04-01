# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

cvTopPosition = {}
p_anchorTopPosition = {}

# page fadein effect
$(window).load ->
  $("#loader").delay(100).hide()
  $(".container-narrow").hide().delay(300).fadeIn 800, ->
    small_map_zoom_center_align(Gmaps.map_canvas1)
    center = Gmaps.map_canvas1.map.getCenter()
    google.maps.event.trigger($("#map_canvas1")[0], 'resize')
    Gmaps.map_canvas1.map.setCenter(center)
    cvTopPosition = jQuery("#resume").offset().top
    p_anchorTopPosition = jQuery("#p_anchor").offset().top  

# recalculate 'cvTopPosition' on browser window resize.
$(window).resize ->
  cvTopPosition = $("#resume").offset().top
  p_anchorTopPosition = $("#p_anchor").offset().top
  position_map_popup("b_m_i", "cls", "map_canvas2", "id", 15, 15)
  map_zoom_center_align(Gmaps.map_canvas2, "#map_canvas2", "#close_map_link_container", 15, 15)

$(document).ready ->
  
  $("#btn-l").click (event) ->
    event.preventDefault()
    
    # Scroll to target
    $("html, body").animate
      scrollTop: cvTopPosition - 20
    , "slow"
    

  #toggle presentation

  $("#start_show").click (event) ->
    event.preventDefault()
    $("#am").toggle()
    $("#presentation").fadeToggle "slow", ->
    
    $(".carousel").carousel interval: 25000
    $(".carousel").carousel "cycle"

    # Scroll to target
    $("html, body").animate
      scrollTop: p_anchorTopPosition + 10
    , "slow"
    

  $(".close_slideshow, #close_presentation").click (event) ->
    event.preventDefault()
    $("#presentation").toggle()
    $("#am").fadeToggle "slow", ->
    $(".carousel").carousel "pause"
    cvTopPosition = jQuery("#resume").offset().top
    p_anchorTopPosition = jQuery("#p_anchor").offset().top

    # Scroll to top
    $("html, body").animate
      scrollTop: 0
    , 700
    
    #quietly go to first slide
    $('.carousel').carousel 0;
    

  $(".slide_align").click (event) ->
    event.preventDefault()
    p_anchorTopPosition = jQuery("#p_anchor").offset().top

    # Scroll to top
    $("html, body").animate
      scrollTop: p_anchorTopPosition + 10
    , 800

  $(".go-to-top").click (event) ->
    event.preventDefault()

    # Scroll to top
    $("html, body").animate
      scrollTop: 0
    , 800

  # cv details/compact view toggle
  $("#compact_view").click (event) ->
    event.preventDefault()
    $("#detailed_view").removeClass "control_active"
    $(this).addClass "control_active"
    $('.record_description_container').hide()
    
  $("#detailed_view").click (event) ->
    event.preventDefault()
    $("#compact_view").removeClass "control_active"
    $(this).addClass "control_active"
    $('.record_description_container').show()

  #tag cloud all tags / top tags toggle
  $("#top_tags").click (event) ->
    event.preventDefault()
    min_count = $(".tag_cloud_item").first().attr("data-min-count")
    $("#all_tags").removeClass "control_active"
    $(this).addClass "control_active"
    $(".tag_cloud_item[data-count='#{min_count}']").each (index) ->
      $(this).next(".tag_cloud_separator").hide()
      $(this).hide()
    $(".tag_cloud_item[data-count!='#{min_count}']").last().next(".tag_cloud_separator").hide()

  $("#all_tags").click (event) ->
    event.preventDefault()
    $("#top_tags").removeClass "control_active"
    $(this).addClass "control_active"
    $('.tag_cloud_item[data-count=1]').each (index) ->
      $(this).next(".tag_cloud_separator").show()
      $(this).show()
    $('.tag_cloud_item[data-count!=1]').last().next(".tag_cloud_separator").show()
    
  #onpage element highlighting
  $(".tag_cloud_item, .tag_item, .record_job_title, .company_name, .location_head, .industry, .school_name, .school_location, .side_company, .side_industry, .side_school, .side_title").click (event) ->
    event.preventDefault()
    currentId = $(this).attr('id')
    toggle_highlight(currentId)
    marker_id = $(this).attr('data-marker-id')
    if $(this).hasClass("highlight_active")
      highlight_marker(Gmaps.map_canvas1, marker_id, true, 5)
    else
      unhighlight_marker(Gmaps.map_canvas1, marker_id, true)
  
  $(".side_location").click (event) ->
    event.preventDefault()
    id= $(this).attr('id')
    toggle_highlight(id)
    marker_id = $(this).attr('data-marker-id')
    if $(this).hasClass("highlight_active")
      highlight_marker(Gmaps.map_canvas1, marker_id, true, 5)
    else
      unhighlight_marker(Gmaps.map_canvas1, marker_id, true) 

  #language section text on country flags mouseover and click (for touchscreen UIs)
  $(".flags_pic").click (event) ->
    event.preventDefault()
    language = $(this).attr("data-language")
    level = $(this).attr("data-level")
    
    $('.flags_pic').not(this).css
      "border-color": "#ffffff"
    $(this).css
      "border-color": "#D6C537"
    $("#lng").text(language)
    $("#lvl").text(level)
  
  $(".flags_pic").mouseover (event) ->
    language = $(this).attr("data-language")
    level = $(this).attr("data-level")
  
    $(this).css
      "border-color": "#D6C537"
    $("#lng").text(language)
    $("#lvl").text(level)
      
  $(".flags_pic").mouseout (event) ->
    $(this).css
      "border-color": "#ffffff"
    $("#lng").text("")
    $("#lvl").text("")

  #interests section text on interests icons mouseover and click (for touch screen UIs)
  $(".interests_pic").click (event) ->
    event.preventDefault()
    info = $(this).attr("data-info")
    $('.interests_pic').not(this).css
      "border-color": "#ffffff"
    $(this).css
      "border-color": "#D6C537"
    info = $(this).attr("data-info")
    $("#interests_infobox").text(info)

  $(".interests_pic").mouseover (event) ->    
    info = $(this).attr("data-info")
    $(this).css
      "border-color": "#D6C537"
    $("#interests_infobox").text(info)

  $(".interests_pic").mouseout (event) ->
    $(this).css
      "border-color": "#ffffff"
    $("#interests_infobox").text("")

  #show large map
  $("#view_large_map_btn").click (event) ->
    event.preventDefault()
    $('#add_highlight_msg').hide()
    $('#del_highlight_msg').hide()
    position_map_popup("b_m_i", "cls", "map_canvas2", "id", 15, 15)
    $('#big_map_container').fadeIn 500, ->
    map_zoom_center_align(Gmaps.map_canvas2, "#map_canvas2", "#close_map_link_container", 15, 15)
      
  $("#close_map_link").click (event) ->
    event.preventDefault()
    $('#add_highlight_msg').hide()
    $('#del_highlight_msg').hide()
    $('#big_map_container').fadeOut 500, ->
   
   #show email explaination
   $("#ml_address").click (event) ->
     event.preventDefault()
     $('#email_explain').fadeIn(500).delay(2500).fadeOut 800, ->

  #highlight locations for gmap markers onclick events
  Gmaps.map_canvas1.callback = ->
    i = 0
    while i < Gmaps.map_canvas1.markers.length          
      google.maps.event.addListener Gmaps.map_canvas1.markers[i].serviceObject, "click", toggleMarker(Gmaps.map_canvas1, Gmaps.map_canvas1.markers[i])
      i++
      
  Gmaps.map_canvas2.callback = ->
    i = 0
    while i < Gmaps.map_canvas2.markers.length
      Gmaps.map_canvas2.markers[i].serviceObject.setZIndex(1)
      google.maps.event.addListener Gmaps.map_canvas2.markers[i].serviceObject, "click", toggleBigMarker(Gmaps.map_canvas2, Gmaps.map_canvas2.markers[i].id)
      i++

toggleMarker = (_map, marker) ->
  ->    
    unless marker.is_selected
      highlight_marker(_map, marker.id, false)
    else
      unhighlight_marker(_map, marker.id, false)
    
    corresponding_city = $(".side_location[data-marker-id='#{marker.id}']")
    toggle_highlight(corresponding_city.attr('id'))

toggleBigMarker = (_map, currentId) ->
  ->
    j = 0
    while j < _map.markers.length
      if _map.markers[j].id is currentId
        _map.markers[j].is_selected = true
        _map.markers[j].serviceObject.setZIndex(99)
        _map.markers[j].serviceObject.setIcon("/assets/marker_light.png")
        google.maps.event.addListener _map.markers[j].infowindow, "closeclick", resetMarkerHighlight(_map.markers[j])
      else
        _map.markers[j].is_selected = false
        _map.markers[j].serviceObject.setZIndex(1)
        _map.markers[j].serviceObject.setIcon("/assets/marker_dark.png")
      j++
      
resetMarkerHighlight = (marker) ->
  ->
    marker.serviceObject.setIcon("/assets/marker_dark.png")
    marker.serviceObject.setZIndex(1)
    
    

toggle_highlight = (id) ->
  elem_id = "#" + id
  $('#del_highlight_msg').clearQueue()
  $('#add_highlight_msg').clearQueue()
  data_info = $(elem_id).attr("data-info")
  data_text = $(elem_id).attr("data-flash-text")
  selection = ".tag_cloud_item[data-info='#{data_info}'], .tag_item[data-info='#{data_info}'], .record_job_title[data-info='#{data_info}'], .company_name[data-info='#{data_info}'], .location_head[data-info='#{data_info}'], .industry[data-info='#{data_info}'], .school_name[data-info='#{data_info}'], .school_location[data-info='#{data_info}'], .side_company[data-info='#{data_info}'], .side_industry[data-info='#{data_info}'], .side_location[data-info='#{data_info}'], .side_school[data-info='#{data_info}'], .side_title[data-info='#{data_info}']"
  content_deselect  = "All highligths of <span id='deselected_item' class='infobox_highlight'>#{data_text}</span> have been removed."
  content_select = "All instances of <span id='selected_item' class='infobox_highlight'>#{data_text}</span> occuring on this page have been highlighted. Click any of them to undo."
  if $(elem_id).hasClass("highlight_active")
    $(selection).removeClass "highlight_active"
    $('#del_highlight_msg').hide()
    $('#add_highlight_msg').hide()
    $("#del_highlight_msg").html(content_deselect)
    $('#del_highlight_msg').fadeIn(250).delay(2300).fadeOut 250, ->
  else
    $(selection).addClass "highlight_active"
    $('#add_highlight_msg').hide()
    $('#del_highlight_msg').hide()
    $("#add_highlight_msg").html(content_select)
    $('#add_highlight_msg').fadeIn(250).delay(3300).fadeOut 250, ->

position_map_popup = (container_name, container_type = "id", map_name, map_type, border_horizontal = 0, border_vertical = 0) ->  
  switch container_type
    when "cls" then elem = "." + container_name
    when "id" then elem = "#" + container_name
    
  switch map_type
    when "cls" then elem_map = "." + map_name
    when "id" then elem_map = "#" + map_name
    
  margin_horizontal = 0.05
  margin_vertical = 0.05
  w = $(window).width() * (1 - margin_horizontal * 2) - border_horizontal*2
  h = $(window).height() * (1 - margin_vertical  * 2) - border_vertical*2
  l = $(window).width() * margin_horizontal
  t = $(window).height() * margin_vertical 
  
  set_position(elem, l, t, w, h)
  positon_big_map(elem_map, elem)
 
small_map_zoom_center_align = (_map) ->
  _map.map.setCenter(new google.maps.LatLng(35.0, -50.0))
  _map.map.setZoom(1) unless _map.map.getZoom() is 1

positon_big_map = (item, reference) ->  
  w = $(reference).width()
  h = $(reference).height()
  
  set_position(item, 0, 0, w, h)
  
  center = Gmaps.map_canvas2.map.getCenter()
  google.maps.event.trigger($("#map_canvas2")[0], 'resize');
  Gmaps.map_canvas2.map.setCenter(center)

set_position = (item, left, top, width, height) ->
  $(item).css('left', left)
  $(item).css('top', top)
  $(item).width(width)
  $(item).height(height)
  
map_zoom_center_align = (_map, map_id, close_btn_container, border_horizontal, border_vertical) ->
  if $(window).width() <= 620 then zoom = 1 else zoom = 2
  
  w = $(window).width()
  h = $(window).height()
  
  zoom = switch
    when w <= 620 then 1
    when w > 620 and w < 1400 then 2
    else 3
  
  margin_horizontal = 0.05
  margin_vertical = 0.05
  
  google.maps.event.trigger($(map_id)[0], 'resize')
  
  switch zoom
    when 1
      if h >= 400
        _map.map.setCenter(new google.maps.LatLng(0.0, -33.023438))
      else
        _map.map.setCenter(new google.maps.LatLng(50.4378, -33.023438))
        
      $(close_btn_container).css('top', $(window).height() * margin_vertical + border_vertical + $(map_id).height() - 155)  
      $(close_btn_container).css('left', $(map_id).width() + $(window).width() * margin_horizontal + border_horizontal - $(close_btn_container).width())
    else
      if h >= 500
        _map.map.setCenter(new google.maps.LatLng(17.917923, -33.023438))
      else
        _map.map.setCenter(new google.maps.LatLng(50.4378, -33.023438))
        
      $(close_btn_container).css('top', $(window).height() * margin_vertical + border_vertical)  
      $(close_btn_container).css('left', ($(window).width() / 2) - ($(close_btn_container).width() / 2))
    
  _map.map.setZoom(zoom)
  
highlight_marker = (_map, currentId, centerMap = true, zoomLevel = false) ->
  j = 0
  while j < _map.markers.length
    if _map.markers[j].id is currentId
      _map.markers[j].is_selected = true
      if centerMap
        centerpoint = new google.maps.LatLng(_map.markers[j].lat, _map.markers[j].lng)
        _map.map.panTo centerpoint
      if zoomLevel
        _map.map.setZoom zoomLevel
      _map.markers[j].serviceObject.setIcon("/assets/marker_light.png")
      break
    j++
    
unhighlight_marker = (_map, currentId, centerMap = false) ->
  j = 0
  resetZoom = true
  while j < _map.markers.length
    if _map.markers[j].id is currentId
      _map.markers[j].is_selected = false
      _map.markers[j].serviceObject.setIcon("/assets/marker_dark.png")
      centerpoint = new google.maps.LatLng(_map.markers[j].lat, _map.markers[j].lng)
    resetZoom = false if _map.markers[j].is_selected
    j++
  if resetZoom
    small_map_zoom_center_align(Gmaps.map_canvas1)
  else if centerMap and _map.map.getZoom() > 1
    _map.map.panTo centerpoint
    
