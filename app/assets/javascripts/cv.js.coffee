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
  
  $("#btn-l").click ->
    
    # Scroll to target
    $("html, body").animate
      scrollTop: cvTopPosition - 30
    , "slow"
    
    # Stop the link from acting like a normal anchor link
    false

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
    
    # Stop the link from acting like a normal anchor link
    false

  $(".close_show").click (event) ->
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
    
    # Stop the link from acting like a normal anchor link
    false

  $(".slide_align").click (event) ->
    event.preventDefault()
    p_anchorTopPosition = jQuery("#p_anchor").offset().top

    # Scroll to top
    $("html, body").animate
      scrollTop: p_anchorTopPosition + 20
    , 800

