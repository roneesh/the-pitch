$(function(){

	var M = $('.gallery').find('.container');
	
	M.on('mouseover mouseleave click', function(e){
		var t = $(this), wrap = t.find('.wrap'), name = 'active', type = e.type;
		if (type == 'mouseover'){
			wrap.addClass(name);
		} else if (type == 'click') {
			var link = t.attr('data-link');
			if (typeof link != 'undefined' && wrap.hasClass('active')){
				window.open(link);
			} else {
				alert('We don\'t have an account there! :)')
			}
		} else {
			setTimeout(function(){
				wrap.removeClass(name);
			}, 1000);
		}
	});
	
});
