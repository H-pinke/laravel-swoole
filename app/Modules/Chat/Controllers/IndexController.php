<?php

namespace App\Modules\Chat\Controllers;

use App\Modules\Chat\Controllers\Controller;
use Cassandra\Session;
use Illuminate\Http\Request;
use Storage;
use Cache;
use DB;
class IndexController extends Controller
{
    public function index(Request $request) {
        $sessionid = $request->session()->getId();
        return $this->render('index.index',['sessionid' => $sessionid]);
    }

    public function login(Request $request) {
        if ($request->isMethod('post')) {
            $post = $request->post();
            $user = DB::table('user')->where('username', $post['username'])->first();
            if (!$user) {
                return $this->json(500,'用户不存在');
            }
            if(!password_verify ( $post['password'] , $user->password)){
                return $this->json(500,'密码输入不正确!');
            };
            $user->user_id = $user->id;
            unset($user->id);
            session(['chat_user'=>$user]);
            return $this->json(200,'登录成功');
        } else {
            return $this->render('index.login');
        }
    }

    public function loginOut() {
        session(['chat_user'=>null]);
        return redirect('/login');
    }
}