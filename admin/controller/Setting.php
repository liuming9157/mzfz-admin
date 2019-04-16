<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Setting extends Main {
	//基础信息展示
  function index() {
   return $this->fetch();
  }
  //基础信息修改
  function edit() {
   
  }
  //轮播图设置
  function swiper() {
   
  }
  //开屏图设置
  function kp() {
   
  }
  function show(){
    $res=db('setting')->select();
    return json($res);
  }

}