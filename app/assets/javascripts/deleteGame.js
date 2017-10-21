$(document).ready(function() {
	deleteGame();
});

var deleteGame = function(){
	$('#pending-games').on('click', '.delete', function(event){
		event.preventDefault();
		var $deleteButton = $(this);
		var $url =  $deleteButton.closest('form').attr('action');
		
		var request = $.ajax({
			method: 'Delete',
			url: $url
		})
		request.done(function(response){
			console.log(response)
		})
	})
}