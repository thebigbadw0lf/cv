# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# 'targetTopPosition' is the amount of pixels the target
# is from the top of the document
targetTopPosition = {}

# recalculate 'targetTopPosition' on browser window resize.
$(window).resize ->
  targetTopPosition = jQuery("#resume").offset().top

$(document).ready ->
  targetTopPosition = jQuery("#resume").offset().top
  
  # When button is clicked
  $("#btn-l").click ->
    
    # Scroll down to target
    $("html, body").animate
      scrollTop: targetTopPosition - 30
    , "slow"
    
    # Stop the link from acting like a normal anchor link
    false
