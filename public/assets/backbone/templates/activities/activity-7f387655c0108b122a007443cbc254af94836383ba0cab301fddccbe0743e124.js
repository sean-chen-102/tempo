(function() { this.JST || (this.JST = {}); this.JST["backbone/templates/activities/activity"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<style>\n\t/*Activity module*/\n  @media screen and (max-width: 675px) {\n      .activity {\n          width: 300px;\n      }\n  }\n\n  .jumbotron {\n    padding: 0;\n    position: relative;\n  }\n\n  .activity {\n    position: relative;\n    top: 75px;\n    margin: 0 auto;\n    width: 90%;\n    background-color: white;\n    border: 1px solid #ddd;\n    box-shadow: 1px 1px 1px #eee;\n    border-top-left-radius: 5px;\n  \tborder-top-right-radius: 5px;\n    margin-bottom: 50px;\n  }\n\n  .activity header {\n    text-align: center;\n    vertical-align: center;\n    background-color: rgb(31, 137, 229);\n    color: white;\n  }\n\n  .activity header h3 {\n  \tmargin: 0;\n    padding: 15px;\n  }\n\n  /*TODO: Fix adjusting section container*/\n  .activity section {\n  \toverflow: hidden;\n  \tmargin-bottom: 0;\n    padding: 10px;\n\n  }\n\n  .activity section p {\n  \toverflow: scroll;\n    width: 100%;\n  \tfont-family: \'Lato\', sans-serif;\n    font-weight: 300;\n  \tfont-size: 100%;\n  \tmargin: 10px;\n    padding: 10px;\n  }\n\n  .activity section .thumbnail {\n    width: 100%;\n    overflow: scroll;\n    border: none;\n    font-size: 18px;\n    margin-bottom: 100px;\n  }\n\n  .activity section .content-video {\n    text-align: center;\n  }\n\n  .activity section .likeContainer {\n  \tmargin: 0 auto;\n  }\n\n  .activity .footer {\n    height: 100px;\n    position: absolute;\n    width: 100%;\n  \tbackground-color: #f5f5f5;\n  \tbottom: 0;\n  \tborder: 1px solid #ddd;\n    margin-top: 30px;\n  }\n\n  .activity .footer a {\n  \ttop: 10px;\n  \ttext-decoration: none;\n  \tcolor: #2980B9;\n  }\n\n  .activity footer a:hover {\n  \tbackground-color: #f5f5f5;\n  \tcolor: #2980B9;\n  \topacity: .7;\n  }\n\n  #like-count {\n    color: rgb(92, 184, 92);\n  }\n\n  #dislike-count {\n    color: rgb(217, 83, 79);\n  }\n\n  .like-btn {\n    background-color: rgb(92, 184, 92);\n    border-color: rgb(92, 184, 92);  \n    margin-bottom: 10px;\n  }\n\n  .like-btn:hover, .like-btn:active, .like-btn:visited, .like-btn:focus {\n    background-color: #198A00;\n    outline: none;\n  }\n\n  .dislike-btn {\n    background-color: rgb(217, 83, 79);\n    border-color: rgb(217, 83, 79);\n    margin-bottom: 10px;\n  }\n\n    .dislike-btn:hover, .dislike-btn:active, .dislike-btn:visited, .dislike-btn:focus {\n    background-color: #9D251B;\n    outline: none;\n  }\n\n  .buttonContainer {\n    width: 100%;\n    margin: 0 auto;\n    margin-top: 10px;\n\n  }\n\n  .buttonContainer button:hover {\n  \topacity: .8;\n  \tcursor: pointer;\n  }\n\n  .likeContainer {\n    width: 25%;\n    margin: 0 auto;\n    text-align: center; \n  }\n\n\n  .linkContainer {\n    margin-top: -35px;\n    padding-left: 10px;\n    padding-right: 10px; \n  }\n\n  a:hover {\n  \tbackground-color: transparent;\n    font-size: 100%;\n  }\n\n  #share {\n    float: right;\n    cursor: pointer;\n    margin-right: 10px;\n    font-size: 25px;\n    margin-top: 25px;\n\n  }\n\n  #back {\n    font-size: 25px;\n    margin-left: 10px;\n    float: left;\n    margin-top: 25px;\n  }\n\n  #likes {\n    margin-right: 25px;\n    font-size: 14px;\n  }\n\n  #dislikes {\n    font-size: 14px;\n    margin-left: 28px;\n  }\n\n\n  #link {\n    margin-top: 10px;\n    font-size: 18px;\n  }\n</style>\n\n\n<div class="jumbotron activity">\n  <header>\n      <h3 id="title">',  title ,'</h3>\n  </header>  \n\n  <section>\n    <div class="thumbnail">\n      <!-- <img src="..." alt="..."> -->\n      <p>\n        <div id="content">',  content ,'</div>\n      </p>\n    </div>\n  </section>\n\n  <footer class="footer">\n      <div class="buttonContainer">\n      <a id="back" href=\'',  backLink ,'\'> Back </a>   \n      <a id="share"> Share </a>\n      <div class="likeContainer">\n      <span id="likes"><span id="like-count">',  likes ,'</span></span>\n      <span id="dislikes"><span id="dislike-count">',  dislikes ,'</span></span>\n      <br>\n      <button class=\'btn btn-primary like-btn\' role="button">Like</button>\n      <button class=\'btn btn-primary dislike-btn\' role="button">Dislike</button><br> \n      <div class="content-link"><a id="link" href=\'',  link ,'\' target="_blank"> Link </a></div>\n      </div> \n      </div>\n  </footer>\n</div>\n');}return __p.join('');};
}).call(this);
