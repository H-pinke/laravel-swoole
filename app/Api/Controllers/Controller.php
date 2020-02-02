<?php
namespace App\Api\Controllers;
use App\Common\Controller as BaseController;
use Illuminate\Http\Request;

/**
 * @api {get} /user/:id 用户请求信息
 * @apiName GetUser
 * @apiGroup User
 *
 * @apiParam {Number} id Users unique ID.
 *
 * @apiSuccess {String} firstname Firstname of the User.
 * @apiSuccess {String} lastname  Lastname of the User.
 */
abstract class Controller extends BaseController
{
    public function __construct() {
       // parent::__construct();
        //$this->middleware('api_agent_authenticated');
        $this->middleware('api_logger');
       // $this->middleware('throttle');
//        $this->middleware('api_rate_limit');
        //$this->middleware('before_auto_trimmer');
    }
    public static function actionName() {
        return [];
    }
    /**
     * 为列表生成结果
     * @param Request $request
     * @param $query
     * @param string $countColumns
     * @return array
     */
    protected function queryData(Request $request, $query, $countColumns = '*'){
        $request->merge([
            'start' => $request->get('offset', 0),
            'length' => $request->get('limit', 20),
        ]);
        $sort = $request->get('sort', 'id');
        //排序
        if (!$sort) {
            $sort = 'id';
        }
        $column = explode(',', $sort);
        $dir = explode(',', $request->get('order', '1'));
        $dir = preg_replace(['/^0$/','/^1$/'],['DESC','ASC'], $dir);
        $order = [];
        foreach ($column as $key=>$val) {
            $order[] = [
                'column' => $val,
                'dir' => isset($dir[$key]) && !empty($dir[$key])? $dir[$key] : 'ASC'
            ];
        }
        if (count($order) > 0) {
            $request->merge([
                'order' => $order
            ]);
        }
        return parent::queryData($request, $query, $countColumns);
    }
}