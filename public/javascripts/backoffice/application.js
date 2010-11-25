var old_value;

$(document).ready(function(ev){

    if ($('div.right.menu').length>0) {
      $('div.right.menu').height($('div.block div.med div.left').height());
    }
    
    //remove text from input
    $('input.main_search').focusin(function(ev){
      var value = $(this).attr('value');
      console.log(value);
      if (value == "Search donors by name, place,..." || value == "Search NGOs by name, place,..." || value == "Search projects by name, place,..." || value == "Search sites by name, place,...") {
        old_value = value;
        $(this).attr('value','');
      }
    });
    $('input.main_search').focusout(function(ev){
      var value = $(this).attr('value');
      if (value == "") {                                      
        $(this).attr('value',old_value);
      }
    });
    
    //if there is an error in some field
    $('a.error').hover(
      function() {
        $(this).parent().find('div.error_msg').show();
      }
    );
    $('div.error_msg p').hover(function(){},
      function() {
        $(this).parent().hide();
      }
    );

	//  combo status 
	$('span#status_combo_search').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();

		if (!$(this).hasClass('clicked')){
			$(this).addClass('clicked');
		}else {
			$(this).removeClass('clicked');
		}
		
		$(document).click(function(event) {
			if (!$(event.target).closest('span#status_combo_search').length) {
				$('span#status_combo_search').removeClass('clicked');
			};
		});
	});

	$('span#status_combo_search').find('a').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		var id = $(this).attr('id');
		$('input#status_input').val(id);
		$('span#status_combo_search').removeClass('clicked');
	});


	//  COMBO COUNTRY
	$('span#country_combo_search').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();

		if (!$(this).hasClass('clicked')){
			$(this).addClass('clicked');
		}else {
			$(this).removeClass('clicked');
		}
		
		$(document).click(function(event) {
			if (!$(event.target).closest('span#country_combo_search').length) {
				$('span#country_combo_search').removeClass('clicked');
			};
		});
	});

	$('span#country_combo_search').find('a').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		var id = $(this).attr('id');
		$('input#country_input').val(id);
		$('span#country_combo_search').removeClass('clicked');
	});
	
	// END COUNTRY

	//  COMBO CLUSTER
	$('span#cluster_combo_search').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();

		if (!$(this).hasClass('clicked')){
			$(this).addClass('clicked');
		}else {
			$(this).removeClass('clicked');
		}
		
		$(document).click(function(event) {
			if (!$(event.target).closest('span#cluster_combo_search').length) {
				$('span#cluster_combo_search').removeClass('clicked');
			};
		});
	});

	$('span#cluster_combo_search').find('a').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		var id = $(this).attr('id');
		$('input#cluster_input').val(id);
		$('span#cluster_combo_search').removeClass('clicked');
	});
	
	// END CLUSTER

	//  SECTOR CLUSTER
	$('span#sector_combo_search').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();

		if (!$(this).hasClass('clicked')){
			$(this).addClass('clicked');
		}else {
			$(this).removeClass('clicked');
		}
		
		$(document).click(function(event) {
			if (!$(event.target).closest('span#sector_combo_search').length) {
				$('span#sector_combo_search').removeClass('clicked');
			};
		});
	});

	$('span#sector_combo_search').find('a').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		var id = $(this).attr('id');
		$('input#sector_input').val(id);
		$('span#sector_combo_search').removeClass('clicked');
	});
	
	// END CLUSTER
	
	//  combo tags click
	$('div.list_combo').children('span.combo_large').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		
		if ($(this).attr('id') == 'hidden'){
			$('div.list_combo').find('ul.list_combo_content').css('display','inline');
			$(this).addClass('displayed');
			$(this).attr('id','visible');
		}else{
			$('div.list_combo').find('ul.list_combo_content').css('display','none');
			$(this).attr('id','hidden');
			$(this).removeClass('displayed');
		}
		
		$(document).click(function(event) {
			if (!$(event.target).closest('ul.list_combo_content').length) {
				$('div.list_combo').find('ul.list_combo_content').css('display','none');
				$('div.list_combo').children('span.combo_large').attr('id','hidden');
				$('div.list_combo').children('span.combo_large').removeClass('displayed');
			};
		});
	});
	
	$('ul.list_combo_content').find('li.element').click(function(ev){
		$('input#project_primary_organization_id').val($(this).attr('id'));
		
		$('div.list_combo').find('ul.list_combo_content').css('display','none');
		$('div.list_combo').children('span.combo_large').attr('id','hidden');
		$('div.list_combo').children('span.combo_large').removeClass('displayed');
	});
	// end combo tags click
	
	$('span.combo_date').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		
		if (!$(this).hasClass('clicked')){
			$('span.combo_date.clicked').removeClass('clicked');
			$(this).addClass('clicked');
		}

		$(document).click(function(event) {
			if (!$(event.target).closest('span.combo_date').length) {
				$('span.combo_date.clicked').removeClass('clicked');
			};
		});
	});
	
	
});

