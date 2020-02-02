<?php
use Illuminate\Routing\Router;
Route::group(['middleware'=>['web','chat_login'],'prefix' => 'chat','module'=>'Chat', 'namespace' => 'App\\Modules\\Chat\\Controllers'], function(Router $router) {
    $router->get('userinfo', 'UserController@userInfo');
    $router->get('getMembers', 'UserController@getMembers');
    $router->get('/', 'IndexController@index');
    $router->get('loginout', 'IndexController@loginOut');
   // $router->get('uploads', 'uploads@loginOut');
});

Route::group(['middleware'=>['web'],'namespace' => 'App\\Modules\\Chat\\Controllers'], function(Router $router) {

    $router->get('/login', 'IndexController@login');
    $router->post('/login', 'IndexController@login');
});
//Route::get('chat/uploads', function (){})->name('uploads');