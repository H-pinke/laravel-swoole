<?php
namespace App\Common\Middleware;
use Closure;
use Exception;
use App\Components\Log\Logger;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
/**
 * API 日志
 *
 * Class ApiLogger
 * @package App\Modules\Common\Middleware
 *
 * @author h-pinke
 */
class ApiLogger
{
    protected $logger;
    /**
     * 日志文件名称路由表
     * @var array
     * [
     *      '日志文件名称' => [
     *          '请求API地址1',
     *          '请求API地址2',
     *      ]
     * ]
     */
    private $logFileNameRouteList = [
        'api_message' => [
            'message',
        ],
        'api_template' => [
            'template',
        ],
    ];
    private function getLogFileName($decodePath){
        foreach($this->logFileNameRouteList as $fileName => $logFileNameList){
            foreach($logFileNameList as $value){
                if(strpos($decodePath, $value) === 0){
                    return $fileName;
                }
            }
        }
        return 'undefined_log_file_route';
    }
    /**
     * @param Request $request
     * @param Closure $next
     * @return mixed
     * @throws \HttpException
     */
    public function handle(Request $request, Closure $next) {
        //初始化日志工具
        $decodePath = str_replace('api/', '', $request->decodedPath());
        $this->logger = new Logger($this->getLogFileName($decodePath));
        $requestCode = str_random(16);
        $input = '';
        foreach($request->input() as $key=>$value){
            $input .= $key . '=' . urldecode($value) . "/r/n";
        }
        $this->logger->info(sprintf('REQ: %s %s %s' . "/r/n" . '%s' . "/r/n" . '%s', $requestCode.'2222', $request->getMethod(), $request->decodedPath(), $request, $input));
        try{
            $response = $next($request);
            $this->logger->info(
                sprintf('RES: %s %s %s' . "/r/n" . '%s', $requestCode, $response->getStatusCode(), Response::$statusTexts[$response->getStatusCode()], $response)
            );
            return $response;
        }catch (\Exception $exception){
            if ($exception instanceof \HttpException) {
                $this->logger->error(
                    sprintf('RES %s Error: %s' . PHP_EOL . ' %s' . PHP_EOL, $requestCode, $exception->getMessage(), $exception->getResponse()->getReasonPhrase(),
                        [
                            'exception' => $exception,
                        ])
                );
            } else {
                $this->logger->error(
                    sprintf('RES %s Error: %s' . PHP_EOL, $requestCode, $exception->getMessage()),
                    [
                        'exception' => $exception,
                    ]
                );
            }
            throw $exception;
        }
    }
}