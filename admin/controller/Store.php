<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;
use app\admin\model\Store as StoreModel;

class Store extends Main {
  //商家列表展示
  function index() {
   return $this->fetch();
  }
   //商家审核通过
  function able($id) {
  $store=db('store')->where('id',$id)->find();
  if($store['status']==2){
    db('store')->where('id',$id)->update(['status'=>1]);//改变商家状态
    db('admin_user')->insert(['name'=>$store['phone'],'password'=>'123456','sid'=>$id]);//为商家开通后台权限
  }
  }
    //商家禁用
  function disable($sid) {

  $store=StoreModel::get($sid);
  $store->status='2';
  $store->save;
  }
    //商家删除
  function del() {
  
  }
  function show(){
    $res=StoreModel::all();
    return json($res);
  }
}