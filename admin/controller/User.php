<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;
use app\admin\model\User as UserModel;

class User extends Main {
	//用户列表
  function index() {
   return $this->fetch();
  }
  //用户禁用
  function disable() {
   
  }
  //用户启用
  function able() {
   
  }
  function show(){
    $res=UserModel::all();
    return json($res);
  }
  //分销用户列表渲染
  function fenxiao() {
   return $this->fetch();
  }
  //分销用户列表
  function fenxiao_show() {
   $user=new UserModel;
   $fx=$user->where('is_fx',1)->where('status',1)->select();
   for ($i=0; $i <count($fx) ; $i++) { 
     $total=db('fx')->where('uid1',$fx[i]['id'])->sum('price');
     $fx[i]['total']=$total;
   };
   $res['count']=count($fx);
   $res['fx']=$fx;
    return json($res);
  }
}