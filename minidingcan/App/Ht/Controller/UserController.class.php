<?php
namespace Ht\Controller;
use Think\Controller;
class UserController extends PublicController{

	//*************************
	// 普通会员的管理
	//*************************
	public function index(){
		$aaa_pts_qx=1;
		$type=$_GET['type'];
		$id=(int)$_GET['id'];
		$tel = trim($_REQUEST['tel']);
		$name = trim($_REQUEST['name']);

		$names=$this->htmlentities_u8($_GET['name']);
		//搜索
		$where="1=1";
		$name!='' ? $where.=" and name like '%$name%'" : null;
		$tel!='' ? $where.=" and tel like '%$tel%'" : null;

		define('rows',20);
		$count=M('user')->where($where)->count();
		$rows=ceil($count/rows);

		$page=(int)$_GET['page'];
		$page<0?$page=0:'';
		$limit=$page*rows;
		$userlist=M('user')->where($where)->order('id desc')->limit($limit,rows)->select();

		$page_index=$this->page_index($count,$rows,$page);
		foreach ($userlist as $k => $v) {
			$userlist[$k]['addtime']=date("Y-m-d H:i",$v['addtime']);
		}

		$this->assign('name',$name);
		$this->assign('tel',$tel);

		//=============
		//将变量输出
		//=============
		$this->assign('type',$type);
		$this->assign('page_index',$page_index);
		$this->assign('page',$page);
		$this->assign('userlist',$userlist);
		$this->display();	
	}

	//*************************
	//会员地址管理
	//*************************
	public function address(){
		// $aaa_pts_qx=1;
		$id=(int)$_GET['id'];
		if($id<1){return;}
		if($_GET['type']=='del' && $id>0 && $_SESSION['admininfo']['qx']==4){
		  $this->delete('address',$id);
		}
		//搜索
		$address=M('address')->where("uid=$id")->select();
		
	    //=============
		//将变量输出
		//=============
		$this->assign('address',$address);
		$this->display();
	}

	public function del()
	{
		$id = intval($_REQUEST['did']);
		$info = M('user')->where('id='.intval($id))->find();
		if (!$info) {
			$this->error('会员信息错误.'.__LINE__);
			exit();
		}

		$data=array();
		$data['del'] = $info['del'] == '1' ?  0 : 1;
		$up = M('user')->where('id='.intval($id))->save($data);
		if ($up) {
			$this->redirect('User/index',array('page'=>intval($_REQUEST['page'])));
			exit();
		}else{
			$this->error('操作失败.');
			exit();
		}
	}
	public function add(){

		$id=(int)$_GET['id'];
		//读取用户权限列表
		if($_POST['submit']==true){
			
		   $array = array(
				  'uname' => $_POST['uname'] ,
				  'shop_id' => $_POST['shop_id'],
				  'qx' => (int)$_POST['qx'] ,
				  'sex' => (int)$_POST['sex'] ,
				  'email' => $_POST['email'] ,
				  'pwd' =>MD5(MD5($_POST['password'])) ,
				  'tel' => $_POST['tel'] ,
				  'addtime' => $_POST['addtime']=='' ? time() : strtotime($_POST['addtime']) ,
				  'shop_status' => $_POST['shop_id']? 1 : 0
		    );
			if($id>0){
				//更新
				if($array['pwd']==""){unset($array['pwd']);}
				$sql= M('user')->where("id=$id")->save($array);
			}else{
				//添加
				$sql= M('user')->add($array);
				$id= $sql ?  $sql : 0;
			}
			
			if($sql){  
				 $this->success("提交成功!");
			}else{
				 $this->error("提交失败!");
			}
			return ;
		}
		//如果get到的ID>0 则为编辑状态
		$userinfo = $id>0 ? M('user')->where("id=$id")->find() : "";
		$userinfo['shangchang']=M('shangchang')->where("id=".$userinfo['shop_id'])->getField("name");
		//=============
		//将变量输出
		//=============
		$this->assign('id',$id);
		$this->assign('userinfo',$userinfo);
		$this->display();
	}
	/**
	 * [ajax_refund 退还保证金]
	 * @return [type] [description]
	 */
	public function ajax_refund(){
		$uid=I('post.uid');
		$money=I('post.money');
		$order=M("Applyshop_order");
		$user=M("user");
		//第一步关闭订单
		$re1=$order->where("uid=".$uid." AND del=0 AND status=50 AND price=".$money)->setField("del",1);
		//第二部去除用户保证金
		$re2=$user->where("id=$uid")->setField("shop_money",0);
		if($re1 && $re2){
			$this->ajaxReturn(1);
		}else{
			$this->ajaxReturn(0);
		}
	}
}