$(function(){

	function linkOverWriten(){
		var ROOTPATH = '/gamesandbox-blog/build';
		$('a[href^=/]').each(function(){
			$(this).attr('href',ROOTPATH+$(this).attr('href'));
		})
	}

})