(function() { this.JST || (this.JST = {}); this.JST["backbone/templates/activities/home"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('\n<h3 style=\'color: #e74c3c;\'> Welcome Home ',  name ,'</h3>\n<p>Activity duration</p>\n<select id=\'time-selector\'>\n    ');  _(times).each(function(time) { ; __p.push(' \n        <option value=\'',  time.duration ,'\'>',  time.duration ,'</option>\n    ');  }); ; __p.push('\n</select> \n<button class=\'go-btn\'>GO</button>\n<br>\n<a href=\'tempo#interests\'> Change interests </a>\n<br>\n<a href=\'tempo#settings\'> See your settings</a>\n');}return __p.join('');};
}).call(this);
