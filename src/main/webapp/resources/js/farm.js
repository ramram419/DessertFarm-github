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
			$(".minmenu div").removeClass('select');
			$(".minmenu .cakelist").addClass('select');
			
		}else if(bmenu == "commu"){
			$(".community").addClass('select');
			$(".community img").attr("src","./resources/images/icon_chat_on@2x.png");
			$(".category").removeClass('select');
			$(".category img").attr("src","./resources/images/icon_list_off@2x.png");
			$(".comulist").addClass('select');
			$(".catelist").removeClass('select');
			$(".minmenu div").removeClass('select');
		}
	},
	
	selectmid : function(menu, num){
		$(".minmenu div").removeClass('select');
		$(".midmenu .select ul li").removeClass('active');
		$(".midmenu ."+menu+"list ul li").eq(num).addClass('active');
		$(".midmenu div").find("img").attr("src", function(index, attr){
			if(attr.match('_on')){
				return attr.replace('_on','_off');
			}
		})
		
		
		if(menu == 'cate'){
			if(num == '0'){
				$('.minmenu .cakelist').addClass('select');
			}else if(num == '1'){
				$('.minmenu .bakelist').addClass('select');
			}else if(num == '2'){
				$('.minmenu .dough').addClass('select');
			}else if(num == '3'){
				$('.minmenu .dessert').addClass('select');
			}
		}
	}
	
}