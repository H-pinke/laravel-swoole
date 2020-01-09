<?php
use Illuminate\Routing\Router;
//apidoc -i /Users/hpinke/mywww/laravel-admin/app/Api/Controllers -o /Users/hpinke/mywww/laravel-admin/public/Apidoc
Route::group(['prefix' => 'api','module'=>'Api', 'namespace' => 'App\\Api\\Controllers'], function(Router $router) {
   // $router->post('message', 'MessageController@postMessage');
    $router->get('message', 'MessageController@getMessage');
    $router->get('template', 'TemplateController@getTemplate');
    $router->get('/health/check', 'HealthController@getCheck');
});