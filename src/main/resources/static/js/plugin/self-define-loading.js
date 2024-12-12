// loading_line插件
;(function($){
    'use strict';
    var line_defaluts = {
        showLoading:true,
        top:330,//距离顶端
        width:'100%',
        msg:'数据正在努力加载中...'
    };
    $.fn.extend({
        "loading": function(options) {
            var opts = $.extend({}, line_defaluts, options); //使用jQuery.extend 覆盖插件默认参数
            var This = $(this); //保存当前this的对象
            This.css({
                top:opts.top+'px',
                width: opts.width,
                height: '200px',
                lineHeight: '200px',
                position: 'absolute',
                zIndex: '1000',
            });
            var innerNode=$("<div><img src='../themes/default/images/loading.gif' /> "+opts.msg+"</div>");  // loading图片src 需要替换
            innerNode.css({
                backgroundColor: 'white',
                width: '160px',
                height: '40px',
                lineHeight: '40px',
                border: '2px solid #95B8E7',
                textAlign: 'center',
                margin: '75px auto',
                fontSize: '12px'
            });
            This.html(innerNode[0]);
            return this.each(function(index,el){
                if(opts.showLoading){
                    $(el).css({
                        display:'block'
                    });
                }else{
                    $(el).css({
                        display:'none'
                    });
                }
            });
        }
    });
})(jQuery);
