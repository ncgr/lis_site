/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	
	config.forcePasteAsPlainText = true;
	
	config.toolbar = 'AdminToolbar';
    config.toolbar_AdminToolbar =
	[
	    ['Source','-','Save','NewPage','Preview','-','Templates','Cut','Copy','PasteText'],
	    ['Print', 'SpellChecker','Scayt','Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	    '/',
	    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript','NumberedList','BulletedList'],
	    ['Outdent','Indent','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	    '/',
	    ['Link','Unlink','Anchor','Image','Table','HorizontalRule','SpecialChar','PageBreak'],
	    '/',
	    ['Styles','Format','Maximize','ShowBlocks','-','About']
	];
    
	config.toolbar = 'MemberToolbar';
	config.toolbar_MemberToolbar =
	[
	    ['Source','-','NewPage','Preview','-','Cut','Copy','PasteText'],
        ['Print', 'SpellChecker','Scayt','Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        '/',
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript','NumberedList','BulletedList'],
        ['Outdent','Indent','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        '/',
        ['Link','Unlink','Anchor','Image','Table','HorizontalRule','SpecialChar','PageBreak'],
        '/',
        ['Format','Maximize','ShowBlocks','-','About']
	];
};
