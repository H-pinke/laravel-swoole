<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class FriendGroup extends Model
{
    use Notifiable;

    /**
     * 与模型关联的数据表
     *
     * @var string
     */
     protected $table = 'friend_group';

    public function friend()
    {
        return $this->hasMany('App\Model\Friend','friend_group_id', 'id');
    }

}
