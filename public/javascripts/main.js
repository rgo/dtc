this.pngfix = function() {
	var ie55 = (navigator.appName == "Microsoft Internet Explorer" && parseInt(navigator.appVersion) == 4 && navigator.appVersion.indexOf("MSIE 5.5") != -1);
	var ie6 = (navigator.appName == "Microsoft Internet Explorer" && parseInt(navigator.appVersion) == 4 && navigator.appVersion.indexOf("MSIE 6.0") != -1);
	if (jQuery.browser.msie && (ie55 || ie6)) {		
		$("*").each(function(){
			var bgIMG = $(this).css('background-image');
			if(bgIMG.indexOf(".png")!=-1){
				var iebg = bgIMG.split('url("')[1].split('")')[0];
				$(this).css('background-image', 'none');
				$(this).get(0).runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + iebg + "',sizingMethod='crop')";
			};
		});
	};		
};

this.init = function() {
	pngfix();
};

$(document).ready(function(){	
	init();
});