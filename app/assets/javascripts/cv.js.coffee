# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

cvTopPosition = {}
p_anchorTopPosition = {}

# recalculate 'cvTopPosition' on browser window resize.
$(window).resize ->
  cvTopPosition = jQuery("#resume").offset().top
  p_anchorTopPosition = jQuery("#p_anchor").offset().top

$(document).ready ->
  cvTopPosition = jQuery("#resume").offset().top
  p_anchorTopPosition = jQuery("#p_anchor").offset().top
  
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
  $(".tag_cloud_item, .tag_item, .record_job_title, .company_name, .location_head, .industry, .school_name, .school_location, .side_company, .side_industry, .side_location, .side_school, .side_title").click (event) ->
    event.preventDefault()
    currentId = $(this).attr('id')
    toggle_highlight(currentId)

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


