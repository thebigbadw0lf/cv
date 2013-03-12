# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# 'cvTopPosition' is the amount of pixels the target
# is from the top of the document
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
    
  $(".tag_cloud_item").click (event) ->
    event.preventDefault()
    $('#del_highlight_msg').clearQueue();
    $('#add_highlight_msg').clearQueue();
    data_tag = $(this).attr("data-tag")
    if $(this).hasClass("tag_active")
      $(this).removeClass "tag_active"
      $(".tag_item[data-tag='#{data_tag}']").removeClass "tag_active"
      $('#del_highlight_msg').hide();
      $('#add_highlight_msg').hide();
      $("#deselected_tag").text(data_tag)
      $('#del_highlight_msg').fadeIn(250).delay(2300).fadeOut 250, ->
    else
      $(this).addClass "tag_active"
      $(".tag_item[data-tag='#{data_tag}']").addClass "tag_active"
      $('#add_highlight_msg').hide();
      $('#del_highlight_msg').hide();
      $("#selected_tag").text(data_tag)
      $('#add_highlight_msg').fadeIn(250).delay(3300).fadeOut 250, ->
      
  $(".tag_item").click (event) ->
    event.preventDefault()
    $('#del_highlight_msg').clearQueue();
    $('#add_highlight_msg').clearQueue();
    data_tag2 = $(this).attr("data-tag")
    if $(this).hasClass("tag_active")
      $(this).removeClass "tag_active"
      $(".tag_cloud_item[data-tag='#{data_tag2}']").removeClass "tag_active"
      $(".tag_item[data-tag='#{data_tag2}']").not(this).removeClass "tag_active"
      $('#del_highlight_msg').hide();
      $('#add_highlight_msg').hide();
      $("#deselected_tag").text(data_tag2)
      $('#del_highlight_msg').fadeIn(250).delay(2300).fadeOut 250, ->
    else
      $(this).addClass "tag_active"
      $(".tag_cloud_item[data-tag='#{data_tag2}']").addClass "tag_active"
      $(".tag_item[data-tag='#{data_tag2}']").not(this).addClass "tag_active"
      $('#add_highlight_msg').hide();
      $('#del_highlight_msg').hide();
      $("#selected_tag").text(data_tag2)
      $('#add_highlight_msg').fadeIn(250).delay(3300).fadeOut 250, ->
      
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
      
      

