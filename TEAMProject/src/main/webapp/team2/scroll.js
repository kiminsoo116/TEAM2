/**
 * 
 */
var didScroll;

$(window).scroll(function(event){
	didScroll = true;
});

setInterval(function(){
	if(didScroll){
		hasScrolled();
		didScroll =false;
	}
}, 250);

function hasScrolled() {
	
}