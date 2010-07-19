/**
 * Creates the accordion effect for the home page.
 */

// Current Element id
var currentId = null;

// Expand and contract each accordion link's content. 
Effect.Accordion = function (contentId) {
    var slideDown = 1.0;
    var slideUp = 1.0;
    
    contentId = $(contentId);
    
    text = ["Read More", "Close"];
    contentLinkId = contentId.identify() + '_toggle';
    
    if (currentId != contentId) {
        if (currentId == null) {
            new Effect.SlideDown(contentId, {duration: slideDown});
            $(contentLinkId).update(text[1]);
        } else {	
        	currentLinkId = currentId.identify() + '_toggle';
            
        	new Effect.SlideUp(currentId, {duration: slideUp});
            $(currentLinkId).update(text[0]);
            
            new Effect.SlideDown(contentId, {duration: slideDown});
            $(contentLinkId).update(text[1]);
        }
        currentId = contentId; 
    } else {
    	currentLinkId = currentId.identify() + '_toggle';
        
    	new Effect.SlideUp(currentId, {duration: slideUp});
        $(currentLinkId).update(text[0]);
        
        currentId = null;
    }
};
