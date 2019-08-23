function handleAPILoaded()
{
	$('#search-box-button').attr('disabled', false);
}

function search()
{
	alert(3);
	var q = $('#searchTextBox').val();
	var searchVideoArray;
	var request = gapi.client.youtube.search.list(
	{
		part: 'snippet',
		type : 'video',
		q: q,
		maxResults : 5,
		order : 'viewCount',
	});

	request.execute(function(response)
	{
		var results = response.result;
		var str = "<li id = 'ColumnL' style = 'width : 100%;' class = 'clearfix listLi'>";
		str += "<div style = 'width : 30%; height : 72px; overflow : hidden;' class = 'floatDiv'>순번</div>";
		str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>영상명</div></li>";
		//$('#search-container').html('<pre>' + str + '</pre>');\
		$.each(results.items, function(index, item)
		{
			var videoMap = new Map();
			videoMap.put(videoName, item.snippet.title);
			videoMap.put(videoSrc, item.id.videoId);
			videoMap.put(videoImageSrc, item.snippet.thumbnails.high.url);
			
			searchVideoArray.push(videoMap);

			str += "<li onclick = 'searchVideoListItemSelect(" + index + ", this)' style = 'width : 100%;' class = 'clearfix listLi'>";
			str += "<div style = 'width : 30%; height : 36px; overflow : hidden;' class = 'floatDiv'>" + (index + 1) + "</div>";
			str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>" + item.snippet.title + "</div></li>";
		})
		document.getElementById("searchVideoUl").innerHTML = str;
	});
}