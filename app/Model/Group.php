<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Group extends Model
{
    use Notifiable;

    /**
     * 与模型关联的数据表
     *
     * @var string
     */
    protected $table = 'group';


}
