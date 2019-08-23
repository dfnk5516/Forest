function handleAPILoaded()
{
	$('#search-box-button').attr('disabled', false);
}

function search()
{
	var q = $('#searchTextBox').val();
	var request = gapi.client.youtube.search.list(
	{
		q: q,
		part: 'snippet'
	});

	request.execute(function(response)
	{
		var results = response.result;
		//$('#search-container').html('<pre>' + str + '</pre>');\
		
		console.log(str);
	});
}