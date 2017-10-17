<?php
namespace Ht\Controller;
use Think\Controller;
class EmptyController extends PublicController{
	public function index(){
		//输出百度地图插件的路径
		if(CONTROLLER_NAME =="Baidumap"){
			$path=__ROOT__."/App/Ht/View/Baidumap/"; 
			$this->assign('path',$path);
		}
		$this->display();
	}	
}