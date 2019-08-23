//function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}
function handleAPILoaded()
{
	$('#search-box-button').attr('disabled', false);
}

function search()
{
	alert(3);
	var q = $('#searchTextBox').val();
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
		
		$.each(results.items, function(index, item)
		{
			//alert(item.snippet.title);
			//alert(item.id.videoId);
			//alert(item.snippet.thumbnails.high.url);
			
			str += "<li onclick = 'videoListItemSelect(" + index + ", this)' style = 'width : 100%;' class = 'clearfix listLi'>";
			str += "<div style = 'width : 30%; height : 36px; overflow : hidden;' class = 'floatDiv'>" + (index + 1) + "</div>";
			str += "<div style = 'width : 70%; overflow : hidden;' class = 'floatDiv'>" + item.snippet.title + "</div></li>";
		})
		document.getElementById("searchVideoUl").innerHTML = str;
	});
}