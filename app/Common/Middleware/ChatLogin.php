<?php

namespace App\Common\Middleware;
use Closure;
use DB;
class ChatLogin{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
       // dd(Session()->flush());
        //dd($request->session()->flush('chat_user'));
        $session = $request->session()->get('chat_user');
        //dd($session);
        if ($session == null) {
           return redirect("/login");//跳转到完善信息页
        }
        return $next($request);
    }
}