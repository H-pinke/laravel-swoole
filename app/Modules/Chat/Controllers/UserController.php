<?php

namespace App\Modules\Chat\Controllers;

use App\Model\Friend;
use App\Model\FriendGroup;
use App\Model\Group;
use App\Model\User;
use App\Modules\Chat\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Storage;
//use Cache;
use DB;
class UserController extends Controller
{
    protected $_uid;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->_uid = session('chat_user')->user_id;
            return $next($request);
        });
    }

    public function userInfo() {
        $userId = $this->_uid;
        $friend_groups = DB::table('friend_group')->select('id','groupname')->where('user_id', $userId)->get();
        foreach ($friend_groups as $k => $v) {
            $friend_groups[$k]->list =  User::whereHas('friends',function ($query) use($userId,$v){
                    $query->where('user_id',$userId)->where('friend_group_id',$v->id);
                })->select('nickname as username','id','avatar','sign','status')->get();
        }

        $mine = User::select('nickname as username','id','avatar','sign','status')->find($userId);
        $group = DB::table('group')->select('id','groupname','avatar')->where('user_id', $userId)->get();
        $data = [
            'mine'   => $mine,
            'friend' => $friend_groups,
            'group'  => $group
        ];
        return $this->json(0,'',$data);
    }

    /**
     * 查看群成员所属
     */
    public function getMembers(Request $request) {
        $groupId = $request->input('id',0);
        $groupMember['list'] = User::whereHas('groupMember',function ($query) use($groupId){
            $query->where('group_id',$groupId);
        })->select('nickname as username','id','avatar','sign','status')->get();
        return $this->json(0,'',$groupMember);
    }
}