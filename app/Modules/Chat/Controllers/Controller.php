<?php

namespace App\Modules\Chat\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    protected function json($code = 200,$msg = '',$data = [])
    {
        if ($data == []) {
            $res = [
                'code'  =>$code,
                'msg'   =>$msg,
            ];
        }else{
            $res = [
                'code'  =>$code,
                'msg'   =>$msg,
                'data'  =>$data
            ];
        }
        return response()->json($res)->header('Content-Type', 'text/html; charset=UTF-8');
    }

    /**
     * Make a admin view render
     *
     * @param null $view
     * @param array $data
     * @param array $mergeData
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    protected function render($view = null, $data = [], $mergeData = []){
        return view('Chat::'  . $view, $data, $mergeData);
    }
}
