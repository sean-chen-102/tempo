(function() { this.JST || (this.JST = {}); this.JST["backbone/templates/activities/history"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<!-- Temporary styling -->\n\n<div class="historyOuter">\n<div class="histContainer">\n\t<header> \n\t\t<h3 id=\'historyTitle\'> History for ',  name,' </h3> \n\t</header>\n\t<section>\n\t\t<div class="tableContainer">\n\t\t\t<table id="histTable" class="table table-hover">\n\t\t\t\t<tbody>\n\t\t\t\t\t');  _.each(data, function(custAct) { ; __p.push(' \n\t\t\t\t\t\t<tr class=\'history ',  custAct.id ,'\'>\n\t\t\t\t\t\t\t<td> <a href=\'/tempo#activities/',  custAct.id,'?history=true\'> ',  custAct.title,' </a> </td>\n\t\t\t\t\t\t\t<td>\t<button class="btn share-button" id="activity-',  custAct.id,'"> share </button> </td>\n\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t');  }); ; __p.push('\t\t\t\n\t\t\t\t</tbody>\n\t\t\t</table>\n\t\t</div>\n\t</section>\n</div>\n\n<div class="custHistContainer">\n\t<header> \n\t\t<h3 id=\'customHistoryTitle\'> Custom Activity History for ',  name,' </h3> \n\t</header>\n\t<section>\n\t\t<div class="tableContainer">\n\t\t\t<table id="customHistTable" class="table table-hover">\n\t\t\t\t<tbody>\n\t\t\t\t\t');  _.each(custData, function(custAct) { ; __p.push(' \n\t\t\t\t\t\t<tr class=\'history ',  custAct.id ,'\'>\n\t\t\t\t\t\t\t<td>  \n\t\t\t\t\t\t\t\t<a href=\'/tempo#customActivity/',  custAct.id,'?history=true\'> ',  custAct.title,' </a>\n\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t');  }); ; __p.push('\t\t\t\n\t\t\t\t</tbody>\n\t\t\t</table>\n\t\t</div>\n\t</section>\n</div>\n</div>\n');}return __p.join('');};
}).call(this);
