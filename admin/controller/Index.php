<?php
namespace app\admin\controller;

use think\Db;
use app\admin\model\AdminUser as UserModel;
use app\admin\model\Image as Image;
use think\Request;

class Index extends Main{
  //空方法
  public function _empty(){
  return view('/public/404');
  }

	//主界面
	public function index(){
        //锁屏跳转
        if(!empty(session('lock'))){
            $this->redirect('admin/index/lockscreen');
        }
		return $this->fetch();
	}
  //修改密码
  function edit_pass($password){
    $user=UserModel::get(session('uid'));
    $user->password=md5($password);
    $user->save();
  }
  // //修改密码页面渲染
  // function edit_pass_show(){
  //   return view();
  // }
//图片编辑
	public function edit(){
      
		return $this->fetch();
	}
  
    //锁屏
    function lockscreen(){
        session('lock',time());
        return $this->fetch('lockscreen');
    }

    //解锁
    function  unlock($password){
        $sql_passwd = UserModel::get(session('uid'))->password;
        if(md5($password)==$sql_passwd){
            session('lock',null);
            $this->success('验证成功','admin/index/index',1000);

        }else{
            $this->error('别逗我，密码不对');
        }

    }
  //视频上传页面
  function uploadvideo(){
  return $this->fetch();
  }
  //视频上传功能
  function upload_video(){
    $src=input('src');
    $time=date('y-m-d H:i:s',time());
  if(db('video')->insert(['src'=>$src,'time'=>$time])){
   $this->success('保存成功');}
  }
  //视频管理页面
  function managevideo(){
    $video=db('video')->select();
    $this->assign('list',$video);
  return $this->fetch();
  }
  //视频删除功能
  function delete_video($id){
  db('video')->where('id',$id)->delete();
     $res['code']=0;
     return $res;
  }

}
