<?php

namespace App\Model;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * 与模型关联的数据表
     *
     * @var string
     */
    protected $table = 'user';

    public function friends()
    {
        return $this->hasOne('App\Model\Friend','friend_id', 'id');
    }

    public function groupMember() {
        return $this->hasOne('App\Model\GroupMember','user_id', 'id');
    }

}
