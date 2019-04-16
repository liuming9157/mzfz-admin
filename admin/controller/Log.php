<?php
namespace app\admin\controller;

use think\Db;
use think\Controller;
class Log extends Controller{

    static function add($actionName,$action,$ip){
        $location_arr = getCity($ip);
        $location = $location_arr['country'].'*'.$location_arr['area'].'*'.$location_arr['region'].'*'.$location_arr['city'];
        Db::name('system_log')
            ->insert([
                'name'          =>  $actionName,
                'way'           =>  $action,
                'username'      =>  session('username'),
                'create_time'   =>  date('Y-m-d H:i:s',time()),
                'ip'            =>  $ip,
                'location'      =>  $location
            ]);
    }
}






