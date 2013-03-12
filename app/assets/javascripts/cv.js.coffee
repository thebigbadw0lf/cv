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
      scrollTop: cvTopPosition - 30
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
    $("#all_tags").removeClass "control_active"
    $(this).addClass "control_active"

  $("#all_tags").click (event) ->
    event.preventDefault()
    $("#top_tags").removeClass "control_active"
    $(this).addClass "control_active"

