<?php
namespace app\admin\model;
use think\Model;

class Store extends Model
{
	//定义数据表
	protected $table = 'lotus_store';
	//定义自动更新时间戳
	protected $autoWriteTimestamp = 'datetime';		

public function product(){
	return $this->hasMany('Product','sid');
}
 public function getStatusAttr($value)
    {
        $status = [1=>'审核通过',2=>'待审核'];
        return $status[$value];
    }
}