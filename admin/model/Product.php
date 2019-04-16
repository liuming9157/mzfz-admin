<?php
namespace app\admin\model;
use think\Model;

class Product extends Model
{
	
	//定义自动更新时间戳
	protected $autoWriteTimestamp = 'datetime';		
	 protected $updateTime = false;
	  public function getStatusAttr($value)
    {
        $status = [1=>'已上架',2=>'未上架'];
        return $status[$value];
    }


}