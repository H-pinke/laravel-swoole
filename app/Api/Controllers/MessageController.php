<?php
namespace App\Api\Controllers;
use App\Api\Controllers\Controller as BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\File\UploadedFile as SymfonyUploadedFile;
use Validator;

class MessageController extends BaseController
{
    /**
     *
     * @apiDefine RkNotFoundException
     *
     * @apiError RkNotFoundException 找不到相关数据
     *
     * @apiErrorExample Error-Response:
     *     HTTP/1.1 404 Not Found
     *     {
     *       "error": {
     *           "code": 404,
     *           "msg": "",
     *           "path" ""
     *       }
     *     }
     *
     */

    /**
     *
     * @api {get} /v3.1/ues/:sn/rt-info 获取设备上报实时信息
     * @apiVersion 3.1.0
     * @apiName GetUeRealTimeInfo
     * @apiGroup UE
     *
     * @apiHeader {String} Authorization 用户授权token
     * @apiHeader {String} firm 厂商编码
     * @apiHeaderExample {json} Header-Example:
     *     {
     *       "Authorization": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOjM2NzgsImF1ZGllbmNlIjoid2ViIiwib3BlbkFJZCI6MTM2NywiY3JlYXRlZCI6MTUzMzg3OTM2ODA0Nywicm9sZXMiOiJVU0VSIiwiZXhwIjoxNTM0NDg0MTY4fQ.Gl5L-NpuwhjuPXFuhPax8ak5c64skjDTCBC64N_QdKQ2VT-zZeceuzXB9TqaYJuhkwNYEhrV3pUx1zhMWG7Org",
     *       "firm": "cnE="
     *     }
     *
     * @apiParam {String} sn 设备序列号
     *
     * @apiSuccess {String} sn 设备序列号
     * @apiSuccess {Number} status 设备状态
     * @apiSuccess {Number} soc 电池电量百分比
     * @apiSuccess {Number} voltage 电池电压
     * @apiSuccess {Number} current 电池电流
     * @apiSuccess {Number} temperature 电池温度
     * @apiSuccess {String} reportTime 上报时间(yyyy-MM-dd HH:mm:ss)
     *
     * @apiSuccessExample Success-Response:
     *     HTTP/1.1 200 OK
     *     {
     *       "sn": "P000000000",
     *       "status": 0,
     *       "soc": 80,
     *       "voltage": 60.0,
     *       "current": 10.0,
     *       "temperature": null,
     *       "reportTime": "2018-08-13 18:11:00"
     *     }
     *
     * @apiUse RkNotFoundException
     *
     */
    public function postMessage(Request $request){
        //验证,参数错误,返回520错误
        $this->validateRequest(config('rule.api.postmsg'), $request, Message::$postMessageAttributes);
        //业务操作
        $result = $this->getService()->send($request);
        return $this->response($request, [
            'data' => $result,
        ]);
    }


    public function getMessage(Request $request){
        //dd('2');
        $messages = [
            'required' => 'The :attribute field is required.',
        ];
       // var_dump('d');die;
//        $this->validate($request, [
//            'id' => 'required',
//        ],['test']);
        //$validator = Validator::make($request, config('rule.api.getmsg'), $messages);
      //  $this->validateRequest(config('rule.api.getmsg'), $request, $messages);

        //验证,参数错误,返回520错误
      //  $this->validateRequest(config('rule.api.getmsg'), $request, $messages);
        //业务操作
       // $result = $this->getService();
        //var_dump($result->getMessage(8));die;
        $result = $this->getService()->getMessage($request->input('request_id'));
        dd($result);
        return $this->response($request, [
            'data' => $result,
        ]);
    }
}