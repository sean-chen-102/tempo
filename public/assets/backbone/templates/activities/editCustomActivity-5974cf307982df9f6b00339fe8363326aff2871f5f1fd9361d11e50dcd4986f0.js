(function() { this.JST || (this.JST = {}); this.JST["backbone/templates/activities/editCustomActivity"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<!-- Temporary styling -->\n<!-- TODO: move this away -->\n\n\n<div class="jumbotron activity">\n\n<form id="custom-activities-form" name="custom-activity"> \n\t<header id="head">\n\t\t<h3> Edit Custom Activity  </h3>\n\t</header>\n\t<section> \n\t\t<label for="title"> Title: </label> <br> \n\t\t<input type="textarea" name"title" id="title" value=\'',  title ,'\'> <br> \n\t\t<label for="content"> Content: </label> <br> <b>\n\t\t<textarea type="text" name"content" id="content" value=\'',  content ,'\'>',  content ,'</textarea> <br> \n\t\t<label for="completion_time"> Completion time: </label> <br> \n\t\t<section> \n\t\t\t<input class="knob" data-width="100" data-displayinput="true" value="',  completion_time,'" height="100" >\n\t\t</section>\t\t\n\t\t<p id="warning"> </p> \n\t\t<br>\n\t\t<button type="button" class="editActivityButton btn btn-primary"> Save </button> \n\t\t<a class="back-button btn btn-primary" href="/tempo#customActivities"> Back </a> \n\t</section> \n</form>\n<div>\n');}return __p.join('');};
}).call(this);
