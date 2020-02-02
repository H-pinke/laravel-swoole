<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>woann-chat</title>
    <link rel="stylesheet" href="/asset/layui/css/layuiv2.css" media="all">
    <style>
        .layui-edge{
            display: block;
        }
    </style>
</head>
<body>
<ul class="layui-nav" >

    <li class="layui-nav-item" style="float: right;">
        <a href="javascript:;"><img src="{{ session('chat_user')->avatar }}" class="layui-nav-img">{{ session('chat_user')->username }}</a>
        <dl class="layui-nav-child">
            <dd><a href="/loginout">退出登录</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item layui-this"><a href="/">首页</a></li>
</ul>
<script src="https://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<script src="/asset/layui/layui.js"></script>
<script>

</script>
<script>
    var ping;
    function sendMessage(socket, data){
        var readyState = socket.readyState;
        console.log("连接状态码："+readyState);
        socket.send(data)
    }
    layui.use('layim', function(layim){
        //基础配置
        layim.config({

            init: {
                url: '/chat/userinfo' //接口地址（返回的数据格式见下文）
                ,type: 'get' //默认get，一般可不填
                ,data: {} //额外参数
            } //获取主面板列表信息，下文会做进一步介绍

            //获取群员接口（返回的数据格式见下文）
            ,members: {
                url: '/chat/getMembers' //接口地址（返回的数据格式见下文）
                ,type: 'get' //默认get，一般可不填
                ,data: {} //额外参数
            }

            //上传图片接口（返回的数据格式见下文），若不开启图片上传，剔除该项即可
            ,uploadImage: {
                url: '' //接口地址
                ,type: 'post' //默认post
            }

            //上传文件接口（返回的数据格式见下文），若不开启文件上传，剔除该项即可
            ,uploadFile: {
                url: '' //接口地址
                ,type: 'post' //默认post
            }
            //扩展工具栏，下文会做进一步介绍（如果无需扩展，剔除该项即可）
            ,tool: [{
                alias: 'code' //工具别名
                ,title: '代码' //工具名称
                ,icon: '&#xe64e;' //工具图标，参考图标文档
            }]

            ,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
            ,find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
            ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatlog.html' //聊天记录页面地址，若不开启，剔除该项即可
        });

        //监听自定义工具栏点击，以添加代码为例
        layim.on('tool(code)', function(insert, send, obj){ //事件中的tool为固定字符，而code则为过滤器，对应的是工具别名（alias）
            layer.prompt({
                title: '插入代码'
                ,formType: 2
                ,shade: 0
            }, function(text, index){
                layer.close(index);
                insert('[pre class=layui-code]' + text + '[/pre]'); //将内容插入到编辑器，主要由insert完成
                //send(); //自动发送
            });
            console.log(this); //获取当前工具的DOM对象
            console.log(obj); //获得当前会话窗口的DOM对象、基础信息
        });
        layim.on('sendMessage', function(res){
            console.log(res);
            var mine = res.mine; //包含我发送的消息及我的信息
            var to = res.to; //对方的信息
            socket.send(JSON.stringify({
                type: 'chatMessage' //随便定义，用于在服务端区分消息类型
                ,data: res
            }));
        });



            //建立WebSocket通讯
        //注意：如果你要兼容ie8+，建议你采用 socket.io 的版本。下面是以原生WS为例

        var socket = new WebSocket('ws://127.0.0.1:9509?sessionid={{ $sessionid }}');
       // console.log(socket);
        //连接成功时触发
        socket.onopen = function(){
            console.log('websocket connect ')
            ping = setInterval(function () {
                sendMessage(socket,'{"type":"ping"}');
                console.log("ping...");
            },1000 * 10)
          //  socket.send('socket');
        };

        //监听收到的消息
        socket.onmessage = function(res){
            console.log('接收到数据'+ res.data);
            var data = JSON.parse(res.data);
            console.log(data);
            if(data.type === 'chatMessage'){
                layim.getMessage(data.data); //res.data即你发送消息传递的数据（阅读：监听发送的消息）
            } else if (data.type === 'ping') {

            }
           // data = JSON.parse(res.data);
           // console.log(res)
            //res为接受到的值，如 {"emit": "messageName", "data": {}}
            //emit即为发出的事件名，用于区分不同的消息
        };
        socket.onerror = function (evt, e) {
            console.log('Error occured: ' + evt.data);
        };

    });
</script>
</body>
</html>
