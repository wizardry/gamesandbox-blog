$(function(){
	function linkOverWriten(){
		var ROOTPATH = '/gamesandbox-blog/build';
		$('a[href^="/"]').each(function(){
			$(this).attr('href',ROOTPATH+$(this).attr('href'));
		})
		$('img[src^="/"]').each(function(){
			$(this).attr('src',ROOTPATH+$(this).attr('src'));
		})
	}
	var $PATH = location.hostname
	
	if($PATH != "localhost"){
		linkOverWriten()
	}
})