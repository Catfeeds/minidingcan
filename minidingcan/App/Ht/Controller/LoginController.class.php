<?php
namespace Ht\Controller;
use Think\Controller;

class LoginController extends PublicController{
	
	public function index(){
		if(IS_POST){
			$username=$_POST['username'];
			$admininfo=M('adminuser')->where("name='$username' AND del<1")->find();
			//查询app表看使用该系统的客户时间
			$appcheck=M('program')->find();
			if($admininfo){
				if(MD5(MD5($_POST['pwd']))==$admininfo['pwd']){
					$admin=array(
					   "id"         =>$admininfo["id"],
					   "name"       =>$admininfo["name"],
					   "qx"         =>$admininfo["qx"],
					   "shop_id"    =>$admininfo["shop_id"],
					   
 					);
 					$system=array(
 						"name"       =>$appcheck['name'],//系统购买者
 						"sysname"    =>$appcheck['title'],//系统名称
					    "photo"      =>$appcheck['logo']//中心认证图片
 				    );
 						unset($_SESSION['admininfo']);
						unset($_SESSION['system']);
						$_SESSION['admininfo']=$admin;
						$_SESSION['system']=$system;
					    $this->success("登陆成功!",U("Index/index"));			
				}else{
					$this->error('账号密码错误');
				}
			}else{
				$this->error('账号不存在或已注销');
			}
		}else{
			$sysname= M('program')->find();
			$this->assign('sysname',$sysname['title']);
			$this->display();
		}
	}
	public function logout(){
		unset($_SESSION['admininfo']);
		unset($_SESSION['system']);
		$this->success("注销成功!",U("Login/index"));
		exit;
	}	
}