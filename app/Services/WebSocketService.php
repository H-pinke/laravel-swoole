<?php
namespace App\Services;
use Hhxsv5\LaravelS\Swoole\WebSocketHandlerInterface;
use Swoole\Http\Request;
use Swoole\WebSocket\Frame;
use Swoole\WebSocket\Server;
use Illuminate\Support\Facades\Log;

/**
 * @see https://wiki.swoole.com/wiki/page/400.html
 */
class WebSocketService implements WebSocketHandlerInterface
{
    private $sessionid = null;
    // 声明没有参数的构造函数
    public function __construct()
    {
        $this->wsTable = app('swoole')->wsTable;
    }
    public function onOpen(Server $server, Request $request)
    {
        // 在触发onOpen事件之前，建立WebSocket的HTTP请求已经经过了Laravel的路由，
        // 所以Laravel的Request、Auth等信息是可读的，Session是可读写的，但仅限在onOpen事件中。
        \Log::info('New WebSocket connection', [$request->fd, request()->all(), session()->getId(), session('xxx'), session(['yyy' => time()])]);
        //('New WebSocket connection', [$request->fd, request()->all(), session()->getId(), session('xxx'), session(['yyy' => time()])]);
        //$server->push($request->fd, 'Welcome to LaravelS');
        $sessionId = $request->get['sessionid'];
        $this->sessionid = $sessionId;
        session()->setId($sessionId);//赋值sessionid
        session()->start();//开启session
        $userId = session('chat_user')->user_id;//获取session中信息
       // var_dump(session('chat_user'));
        //var_dump($userId);
        $this->wsTable->set('uid:' . $userId, ['value' => $request->fd]);// 绑定uid到fd的映射
        $this->wsTable->set('fd:' . $request->fd, ['value' => $userId]);// 绑定fd到uid的映射
        var_dump($this->wsTable->get('uid:' . $userId));
        //$server->push($request->fd, "Welcome to LaravelS #{$request->fd}");
        // throw new \Exception('an exception');// 此时抛出的异常上层会忽略，并记录到Swoole日志，需要开发者try/catch捕获处理
    }
    public function onMessage(Server $server, Frame $frame)
    {

       // var_dump(json_decode($frame->data,true));
        if (!empty($frame->data)) {
            $res = json_decode($frame->data,true);
        } else {
            $res['type'] = null;
        }
        var_dump($this->sessionid);
        session()->setId($this->sessionid);//赋值sessionid
        session()->start();//开启session
        $userId = session('chat_user')->user_id;//获取session中信息
        switch ($res['type']) {
            case 'ping':
                $fd = $this->wsTable->get('uid:' . $userId);
                var_dump($fd);
                $data = [
                    'type' => 'ping',
                    'data' => ''
                ];
               // var_dump($data);
                $server->push($fd['value'], json_encode($data));
                break;
            case 'chatMessage':
                var_dump($res);
                //
                if ($res['data']['mine']['id'] == $res['data']['to']['id']) {
                    return false;
                }
                $replyMessage = [
                    'username'=> $res['data']['mine']['username'], //消息来源用户名
                    'avatar' => $res['data']['mine']['avatar'], //消息来源用户头像
                    'id'=> $res['data']['mine']['id'], //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
                    'type' => "friend", //聊天窗口来源类型，从发送消息传递的to里面获取
                    'content'=> $res['data']['mine']['content'], //消息内容
                   // 'cid'=> 0, //消息id，可不传。除非你要对消息进行一些操作（如撤回）
                    'mine'=> false, //是否我发送的消息，如果为true，则会显示在右方
                   // 'fromid'=> "100000", //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
                    'timestamp'=> time()*1000 //服务端时间戳毫秒数。注意：如果你返回的是标准的 unix 时间戳，记得要 *1000
                ];
               // $this->wsTable->set('uid:' . $userId, ['value' => $request->fd]);
                $fd = $this->wsTable->get('uid:' . $res['data']['to']['id']);
                $data = [
                    'type' => 'chatMessage',
                    'data' => $replyMessage
                ];
                $server->push($fd['value'], json_encode($data));
                break;
            default:break;
        }
        \Log::info('Received message', [$frame->fd, $frame->data, $frame->opcode, $frame->finish]);
        //$server->push($frame->fd, date('Y-m-d H:i:s'));
        // throw new \Exception('an exception');// 此时抛出的异常上层会忽略，并记录到Swoole日志，需要开发者try/catch捕获处理
    }
    public function onClose(Server $server, $fd, $reactorId)
    {
        $uid = $this->wsTable->get('fd:' . $fd);
        if ($uid !== false) {
            $this->wsTable->del('uid:' . $uid['value']); // 解绑uid映射
        }
        $this->wsTable->del('fd:' . $fd);// 解绑fd映射
        $server->push($fd, "Goodbye #{$fd}");
        // throw new \Exception('an exception');// 此时抛出的异常上层会忽略，并记录到Swoole日志，需要开发者try/catch捕获处理
    }
}