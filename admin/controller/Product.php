<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;
use app\admin\model\Product as ProductModel;

class Product extends Main {
 
	//商品列表
  function index() {
    return view();
   
  }
  //商品编辑页面渲染
  function edit_show($id){
    $this->assign('id',$id);
    return view();
  }
  //商品编辑
  function edit(){
$product=new ProductModel;
$data=input();
$product->allowField(true)->save($data['data'],['id'=>$data['id']]);
    
  }
  //商品发布页面渲染
  function add_show(){

    $this->assign('sid',session('sid'));
    return view();
  }
  //商品发布
  function add(){

$product=new ProductModel;
$data=input();
dump($data);
$product->data($data);
$product->allowField(true)->save();
    

  }
  //商品删除
  function del($id){
    ProductModel::destroy($id);

  }
  //商品上架下架
  function shangjia($id){
    
    $product=db('product')->where('id',$id)->find();
    $status=$product['status'];
dump($status);
    if($status==1){
      db('product')->where('id',$id)->update(['status'=>2]);
    }else{
      db('product')->where('id',$id)->update(['status'=>1]);
  }
}
  //秒杀设置
  function ms(){

  }
  //一元抢购
  function qg(){

  }
   //获取商品列表
  function show1($page,$limit){
    $sid=session('sid');
    $data=new ProductModel;
    if($sid==-1){
      $count=$data->count();
     $product=$data->page($page,$limit)->order('id desc')->select();
   }else{
     $count=$data->where('sid',$sid)->count();
     $product=$data->where('sid',$sid)->page($page,$limit)->order('id desc')->select();
   }
    $res['count']=$count;
     $res['product']=$product;
    return json($res) ;
  }
  function show3($id){
    $res=ProductModel::get($id);
    return json($res);
  }
  function order(){
    return view();
  }
  //获取订单列表
  function show2($page,$limit){
   $sid=session('sid');
    if($sid==-1){
      $count=db('order')->count();
     $order=db('order')->page($page,$limit)->order('id desc')->select();
   }else{
     $count=db('order')->where('sid',$sid)->count();
     $order=db('order')->where('sid',$sid)->page($page,$limit)->order('id desc')->select();
   };
   
    $res['count']=$count;
     $res['order']=$order;
    return json($res) ;
  }
  function upload(){
    $file=request()->file('file');
    if($file){
      $info=$file->move(ROOT_PATH.'public'.DS.'uploads');
      if($info){
        $res['name']=$info->getSaveName();
        $res['code']=0;
        return json($res);
      }else{
        echo $file->getError();
      }
    }
  }
}