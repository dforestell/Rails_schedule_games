$(document).ready(function() {
	deleteGame();
});

var deleteGame = function(){
	$('#pending-games').on('click', '.delete', function(event){
		event.preventDefault();
		var $deleteButton = $(this);
		var $url =  $deleteButton.closest('form').attr('action');
		console.log($url);
	})
}