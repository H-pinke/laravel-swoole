<?php
namespace App\Components\Log;
use Log;
use Monolog\Handler\StreamHandler;
use Monolog\Formatter\LineFormatter;
use Monolog\Logger as BaseLogger;
/**
 * Class Logger.php
 * 自定义日志写入器
 *
 * @author hpinke
 */
class Logger extends BaseLogger
{
    public function __construct($name){
        $dateTime = new \DateTime('now', new \DateTimeZone(config('app.log_timezone')));
        $dailyName = snake_case($name) . '-' . $dateTime->format('Y-m-d') . '.log';
        $streamHandler = new StreamHandler( storage_path('/logs/' . $dailyName ), Logger::DEBUG, false);
        $streamHandler->setFormatter(new LineFormatter());
        parent::__construct($name, [ $streamHandler ], Log::getMonolog()->getProcessors());
    }
}