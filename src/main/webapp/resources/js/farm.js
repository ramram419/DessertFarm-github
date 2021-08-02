/**
 * 
 */
 
 if(window.farm)farm = {}
 
 farm = {
	
	selectbig : function(bmenu){
		if(bmenu == 'cate'){
			$(".category").addClass('select');
			$(".category img").attr("src","./resources/images/icon_list_on@2x.png");
			$(".community").removeClass('select');
			$(".community img").attr("src","./resources/images/icon_chat_off@2x.png");
			$(".catelist").addClass('select');
			$(".comulist").removeClass('select');
			
		}else if(bmenu == "commu"){
			$(".community").addClass('select');
			$(".community img").attr("src","./resources/images/icon_chat_on@2x.png");
			$(".category").removeClass('select');
			$(".category img").attr("src","./resources/images/icon_list_off@2x.png");
			$(".comulist").addClass('select');
			$(".catelist").removeClass('select');
		}
	}
	
}