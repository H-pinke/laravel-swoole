<?php

namespace App\Modules;
class ServiceProvider extends \Illuminate\Support\ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if(is_dir(app_path().'/Modules/')) {
            $modules = config("module.modules");
            foreach($modules as $module)  {
                $routes = app_path().'/Modules/'.$module.'/routes.php';
                $views  = app_path().'/Modules/'.$module.'/Views';
                if(file_exists($routes)) $this->loadRoutesFrom($routes);
                if(file_exists($views)) $this->loadViewsFrom($views, $module);
            }
        }
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
