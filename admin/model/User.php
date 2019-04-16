<?php
namespace app\admin\model;
use think\Model;

class User extends Model
{
	//定义数据表
	protected $table = 'lotus_user';
	//定义自动更新时间戳
	protected $autoWriteTimestamp = 'datetime';		

public function address(){
	return $this->hasMany('Address','uid');
}
public function order(){
	return $this->hasMany('Order','uid');
}
public function cart(){
	return $this->hasMany('Cart','uid');
}
public function collection(){
	return $this->hasMany('Collection','uid');
}
public function budget(){
	return $this->hasMany('Budget','uid');
}
public function pt(){
	return $this->hasMany('Pt','uid');
}
public function fx(){
	return $this->hasMany('Fx','uid');
}
public function jz(){
	return $this->hasMany('Jz','uid');
}
 public function getStatusAttr($value)
    {
        $status = [1=>'正常',2=>'禁止'];
        return $status[$value];
    }
}