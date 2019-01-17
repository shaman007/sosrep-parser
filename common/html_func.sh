#!/bin/bash
#TOC source: http://projects.jga.me/toc/#toc3
#Collapsing blocks source: https://codepen.io/peternguyen/pen/hICga/


S_PATH="$1"

function print_header {

    echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\""
    echo "\"http://www.w3.org/TR/html4/strict.dtd\">"
    echo "<html lang=\"en\">"
    echo "<head>"
    echo "<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">"
    echo "<title>Sosreport parser for `cat $S_PATH/hostname`</title>"
    echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"/>"
    echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>"
    echo "<script type=\"text/javascript\" src=\"script.js\"></script>"
    echo "</head>"
    echo "<body>"
    echo " <div id=\"toc\"></div>"

}

function print_footer {
    echo "</script><script>\$('#toc').toc({'selectors': 'h1'});</script>"
    echo "<p><a href=mailto:abondare@redhat.com>abondare@redhat.com</a></p>"
    echo "</body>"
    echo "</html>"

}

function h1 {
    echo "<style>"
    echo "input {"                                                                                        
    echo "  display: none;"
    echo "  visibility: hidden;"
    echo "}"
    echo "label {"
    echo "  display: block;"
    echo "  padding: 0.5em;"
    echo "  font-size: 25px;"
    echo "  text-align: left;"
    echo "  border-bottom: 1px solid #CCC;"
    echo "  color: #666;"
    echo "}"
    echo "label:hover {"
    echo "  color: #000;"
    echo "}"
    echo "#toggle$2:checked ~ #expand$2 { height: auto;}"
    echo "#toggle$2:checked ~ label::before {content: \"\";}"
    echo "#expand$2 {"
    echo "  height: 0px;"
    echo "  overflow: hidden;"
    echo "  transition: height 0.5s;"
    echo "  color: #FFF;"
    echo "}"
    echo "</style>"
    echo "<input id=\"toggle$2\" type=\"checkbox\" checked>"
    echo "<label for=\"toggle$2\"><h1 id=\"link-$2\">$1</h1></label>"
}

function h2 {
    echo "<style>"
    echo "input {"
    echo "  display: none;"
    echo "  visibility: hidden;"
    echo "}"
    echo "label {"
    echo "  display: block;"
    echo "  padding: 0.5em;"
    echo "  font-size: 15px;"
    echo "  text-align: left;"
    echo "  border-bottom: 1px solid #CCC;"
    echo "  color: #666;"
    echo "}"
    echo "label:hover {"
    echo "  color: #000;"
    echo "}"
    echo "#toggle$2:checked ~ #expand$2 { "
    echo "          height: auto;"
    echo "  }"
    echo "#toggle$2:checked ~ label::before {"
    echo "content: \"\";"
    echo "}"
    echo "#expand$2 {"
    echo "      height: 0px;"
    echo "      overflow: hidden;"
    echo "      transition: height 0.5s;"
    echo "      color: #FFF;"
    echo "}" 
    echo "</style>"
    echo "<input id=\"toggle$2\" type=\"checkbox\" checked>"
    echo "<label for=\"toggle$2\"> <h2 id=\"link-$2\">$1</h2> </label>"

}


function code {
    if [[ $1  ]]; then
        echo "<div id=\"expand$2\" class=\"codeSnippet\">"
        echo "<pre><code>$1</code></pre>"
        echo "</div>"
    fi
}

function br {

    echo "<br />"

}

function rm_cm_d {
    for f in $1
    do
        echo "<p>$f</p>" 
        rm_cm "$f" "$f"
    done
}

function print_css {
   
    echo "">./style.css
    echo "body {">>./style.css
    echo "max-width: 80em; background: white; padding: 2em;  margin: 1em auto; }">>./style.css
    echo "pre {">>./style.css
    echo "white-space: pre-wrap;">>./style.css
    echo "white-space: -moz-pre-wrap;">>./style.css
    echo "white-space: -o-pre-wrap;">>./style.css
    echo "word-wrap: break-word;">>./style.css
    echo "background-color: #d3d3d3;">>./style.css
    echo "color: black;">>./style.css
    echo "border-radius: 5px;">>./style.css
    echo "-moz-border-radius: 5px;">>./style.css
    echo "-webkit-border-radius: 5px;">>./style.css
    echo "margin: 1em 0;">>./style.css
    echo "padding: 50px 30px 50px 80px;}">>./style.css
    echo "">>./style.css
    echo "code {">>./style.css
    echo "font-family: Courier, 'New Courier', monospace;">>./style.css
    echo "font-size: 16px;">>./style.css
    echo "}">>./style.css
    echo "section {">>./style.css
    echo "  padding: 0 20px;">>./style.css
    echo "}">>./style.css
    echo "#toc {">>./style.css
    echo "    top: 0px;">>./style.css
    echo "    left: 0px;">>./style.css
    echo "    height: 100%;">>./style.css
    echo "    position: fixed;">>./style.css
    echo "    background: #333;">>./style.css
    echo "    box-shadow: inset -5px 0 5px 0px #000;">>./style.css
    echo "    width: 150px;">>./style.css
    echo "    padding-top: 20px;">>./style.css
    echo "    color: #fff;">>./style.css
    echo "}">>./style.css
    echo "">>./style.css
    echo "#toc ul {">>./style.css
    echo "    margin: 0;">>./style.css
    echo "    padding: 0;">>./style.css
    echo "    list-style: none;">>./style.css
    echo "}">>./style.css
    echo "">>./style.css
    echo "#toc li {">>./style.css
    echo "    padding: 5px 10px;">>./style.css
    echo "}">>./style.css
    echo "">>./style.css
    echo "#toc a {">>./style.css
    echo "    color: #fff;">>./style.css
    echo "    text-decoration: none;">>./style.css
    echo "    display: block;">>./style.css
    echo "}">>./style.css
    echo "">>./style.css
    echo "#toc .toc-h2 {">>./style.css
    echo "    padding-left: 10px;">>./style.css
    echo "}">>./style.css
    echo "">>./style.css
    echo "#toc .toc-h3 {">>./style.css
    echo "    padding-left: 20px;">>./style.css
    echo "}">>./style.css
    echo "">>./style.css
    echo "#toc .toc-active {">>./style.css
    echo "    background: #336699;">>./style.css
    echo "    box-shadow: inset -5px 0px 10px -5px #000;">>./style.css
    echo "}">>./style.css
    echo "  ">>./style.css   
    echo "">./script.js
    #from http://projects.jga.me/toc/#toc3
    echo "!function(a){a.fn.smoothScroller=function(b){b=a.extend({},a.fn.smoothScroller.defaults,b);var c=a(this);return a(b.scrollEl).animate({scrollTop:c.offset().top-a(b.scrollEl).offset().top-b.offset},b.speed,b.ease,function(){var a=c.attr(\"id\");a.length&&(history.pushState?history.pushState(null,null,\"#\"+a):document.location.hash=a),c.trigger(\"smoothScrollerComplete\")}),this},a.fn.smoothScroller.defaults={speed:400,ease:\"swing\",scrollEl:\"body,html\",offset:0},a(\"body\").on(\"click\",\"[data-smoothscroller]\",function(b){b.preventDefault();var c=a(this).attr(\"href\");0===c.indexOf(\"#\")&&a(c).smoothScroller()})}(jQuery),function(a){var b={};a.fn.toc=function(b){var c,d=this,e=a.extend({},jQuery.fn.toc.defaults,b),f=a(e.container),g=a(e.selectors,f),h=[],i=e.activeClass,j=function(b,c){if(e.smoothScrolling&&\"function\"==typeof e.smoothScrolling){b.preventDefault();var f=a(b.target).attr(\"href\");e.smoothScrolling(f,e,c)}a(\"li\",d).removeClass(i),a(b.target).parent().addClass(i)},k=function(){c&&clearTimeout(c),c=setTimeout(function(){for(var b,c=a(window).scrollTop(),f=Number.MAX_VALUE,g=0,j=0,k=h.length;k>j;j++){var l=Math.abs(h[j]-c);f>l&&(g=j,f=l)}a(\"li\",d).removeClass(i),b=a(\"li:eq(\"+g+\")\",d).addClass(i),e.onHighlight(b)},50)};return e.highlightOnScroll&&(a(window).bind(\"scroll\",k),k()),this.each(function(){var b=a(this),c=a(e.listType);g.each(function(d,f){var g=a(f);h.push(g.offset().top-e.highlightOffset);var i=e.anchorName(d,f,e.prefix);if(f.id!==i){a(\"<span/>\").attr(\"id\",i).insertBefore(g)}var l=a(\"<a/>\").text(e.headerText(d,f,g)).attr(\"href\",\"#\"+i).bind(\"click\",function(c){a(window).unbind(\"scroll\",k),j(c,function(){a(window).bind(\"scroll\",k)}),b.trigger(\"selected\",a(this).attr(\"href\"))}),m=a(\"<li/>\").addClass(e.itemClass(d,f,g,e.prefix)).append(l);c.append(m)}),b.html(c)})},jQuery.fn.toc.defaults={container:\"body\",listType:\"<ul/>\",selectors:\"h1,h2,h3\",smoothScrolling:function(b,c,d){a(b).smoothScroller({offset:c.scrollToOffset}).on(\"smoothScrollerComplete\",function(){d()})},scrollToOffset:0,prefix:\"toc\",activeClass:\"toc-active\",onHighlight:function(){},highlightOnScroll:!0,highlightOffset:100,anchorName:function(c,d,e){if(d.id.length)return d.id;var f=a(d).text().replace(/[^a-z0-9]/gi,\" \").replace(/\s+/g,\"-\").toLowerCase();if(b[f]){for(var g=2;b[f+g];)g++;f=f+\"-\"+g}return b[f]=!0,e+\"-\"+f},headerText:function(a,b,c){return c.text()},itemClass:function(a,b,c,d){return d+\"-\"+c[0].tagName.toLowerCase()}}}(jQuery);">>./script.js

}
