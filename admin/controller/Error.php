<?php
namespace app\admin\controller;

use think\Controller;
use thin\Request;

class Error {
public function index(){
return view('public/404');
}
}