# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

cvTopPosition = {}
p_anchorTopPosition = {}

# page fadein effect
$(window).load ->
  $(".container-narrow").hide().delay(100).fadeIn 800, ->
    center = Gmaps.map_canvas1.map.getCenter()
    google.maps.event.trigger($("#map_canvas1")[0], 'resize')
    Gmaps.map_canvas1.map.setCenter(center)
    cvTopPosition = jQuery("#resume").offset().top
    p_anchorTopPosition = jQuery("#p_anchor").offset().top

# recalculate 'cvTopPosition' on browser window resize.
$(window).resize ->
  cvTopPosition = jQuery("#resume").offset().top
  p_anchorTopPosition = jQuery("#p_anchor").offset().top
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
    
    $(".carousel").carousel interval: false
    $(".carousel").carousel "cycle"

    # Scroll to target
    $("html, body").animate
      scrollTop: p_anchorTopPosition + 20
    , "slow"
    

  $(".close_presentation").click (event) ->
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
      scrollTop: p_anchorTopPosition + 20
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
  
  $(".side_location").click (event) ->
    event.preventDefault()
    id= $(this).attr('id')
    fullId = "#" + id
    toggle_highlight(id)
    if $(fullId ).hasClass("highlight_active")
      currentId = $(this).attr('data-marker-id')    
      j = 0
      while j < Gmaps.map_canvas1.markers.length
        if Gmaps.map_canvas1.markers[j].id is currentId
          centerpoint = new google.maps.LatLng(Gmaps.map_canvas1.markers[j].lat, Gmaps.map_canvas1.markers[j].lng)
          Gmaps.map_canvas1.map.panTo centerpoint
          Gmaps.map_canvas1.map.setZoom 5
          break
        j++

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
  
  

  
  

  
