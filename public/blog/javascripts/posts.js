
$(document).observe('dom:loaded', function(){

		
				
		$$('form input[type=text]')[0].activate();
		
		var pt = $('post_title');
		var ps = $('post_slug');
					
		new Form.Element.Observer(pt
			, .33
			, function(){
					var t = pt.getValue()
						.replace(/\s/g, '-')
						.replace(/[^a-z0-9\-\s]/gi, '')
						.truncate(ps.getAttribute('maxlength'), '');
					ps.setValue(t);
		});

});
