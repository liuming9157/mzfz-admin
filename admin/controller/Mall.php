<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Mall extends Main {
  function index() {
   return $this->fetch();
  }
}