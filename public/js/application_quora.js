$(document).ready(function(){
    $(".flip").click(function(){
        $(".panel").slideToggle("slow");
    });
     $(".flip2").click(function(){
        $(".panel2").slideToggle("slow");
    });
$('#newquestion').submit(function(e){
		e.preventDefault();
		$.ajax({
			url: '/new_question',
			method: 'POST',
			data: $(this).serialize(),
			dataType: 'json',
			success: function(data){
				console.log(data);
				$('.table').append('\
					<tbody><tr>\
					<td>' + data.title +'</td>\
					<td>' + data.content + '</td>\
					</tr></tbody>\
				');
			}		
		})
	});
$('.newanswer').submit(function(e){
	targetDiv = $(this);
		e.preventDefault();
		$.ajax({
			url: '/new_answer',
			method: 'POST',
			data: $(this).serialize(),
			dataType: 'json',
			success: function(data){
				console.log(data);
				targetDiv.prev().append('\
					<p>' + data.content +'</td>\
				');
			}		
		})
	});
});
