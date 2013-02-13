//= require prototype
//= require prototype_ujs
//= require effects
//= require dragdrop
//= require controls
//= require dropdownnav
//= require wz_graphics
//= require phylogenetic-tree
//= require_self
//= require_tree .

var hideAccordions = function hideAccordions() {
  var verticalAccordions = $$('.accordion_toggle');
  verticalAccordions.each(function(accordion) {
    $(accordion).hide();
  });
};

Effect.Accordion = function(contentId) {
  var slideDown = 0;
  var slideUp = 0;

  contentId = $(contentId);

  text = ["More [+]", "Close [-]"];
  contentLinkId = contentId.identify() + '_toggle';

  if ($(contentLinkId).innerHTML == text[0]) {
    new Effect.SlideDown(contentId, {duration: slideDown});
    $(contentLinkId).update(text[1]);
  } else {
    new Effect.SlideUp(contentId, {duration: slideUp});
    $(contentLinkId).update(text[0]);
  }
};

