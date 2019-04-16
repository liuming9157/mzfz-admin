<?php
//author:Jack Liu(liuming@mzsat.cn)
//+--------------------------------

namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;

Class Image extends Controller
{
	//上传单图
	/*-0上传成功
	-1图片转移失败
	-2图片上传失败
	*/
public function single(){
	$file=request()->file('file');
if ($file){
$info=$file->move(ROOT_PATH.'public'.DS.'uploads');
if($info){
	$path=$info->getSaveName();
  $time=time();
	$res=[
'code'=>0,
'msg'=>'success',
'path'=>$path
	];
	db('image')->insert(['src'=>$path,'time'=>$time]);
}else{$res=[
'code'=>1,
'msg'=>'move fail',
'path'=>''
	];}
}else{$res=[
'code'=>2,
'msg'=>'accept fail',
'path'=>''
	];}
	return $res;
}
//上传多图
public function multi(){
$files=request()->file('file');
  $num=0;
if($files){
	foreach ($files as $file) {
		$info=$file->move(ROOT_PATH.'public'.DS.'uploads');
      $time=time();
		if($info){
			$path=$info->getSaveName();
			db('image')->insert(['src'=>$path,'time'=>$time]);
          $num+=1;
		}
	}
$res=['code'=>0,'num'=>$num,'msg'=>'success'];
  return $res;
}else{return 'error';}
}
  //删除图片
   function delete_img($id){
   $file=db('image')->where('id',$id)->find();
     $filepath=ROOT_PATH . 'public' . DS . 'uploads'.DS.$file['src'];
     if(unlink($filepath)){
    db('image')->where('id',$id)->delete();
     $res['code']=0;}else{$res['code']=1;}
     return $res;
     
  }
}
