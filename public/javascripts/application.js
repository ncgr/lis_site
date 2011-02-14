/**
 * Hide Accordions.
 */
function hideAccordions () {
	var verticalAccordions = $$('.accordion_toggle');
	verticalAccordions.each(function(accordion) {
		$(accordion).hide();
	});
}

/**
 * Effect Class Method
 * Creates the show / hide accordion effect for the results page.
 */
Effect.Accordion = function (contentId) {
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

/*
 * Registers a callback which copies the csrf token into the
 * X-CSRF-Token header with each ajax request.  Necessary to 
 * work with rails applications which have fixed
 * CVE-2011-0447
*/

Ajax.Responders.register({
  onCreate: function(request) {
    var csrf_meta_tag = $$('meta[name=csrf-token]')[0];

    if (csrf_meta_tag) {
      var header = 'X-CSRF-Token',
          token = csrf_meta_tag.readAttribute('content');

      if (!request.options.requestHeaders) {
        request.options.requestHeaders = {};
      }
      request.options.requestHeaders[header] = token;
    }
  }
});
