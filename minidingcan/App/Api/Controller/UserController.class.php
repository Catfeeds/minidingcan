<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Think\Controller;
class UserController extends PublicController {

	//***************************
	//  获取用户订单数量
	//***************************
	public function getorder(){
		$uid = intval($_REQUEST['userId']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'非法操作！errcode：'.__LINE__));
			exit();
		}

		$order = array();
		$order['pay_num'] = intval(M('order')->where('uid='.intval($uid).' AND status=10 AND del=0')->getField('COUNT(id)'));
		$order['deliver_num'] = intval(M('order')->where('uid='.intval($uid).' AND status=20 AND del=0 AND back="0"')->getField('COUNT(id)'));
		$order['rec_num'] = intval(M('order')->where('uid='.intval($uid).' AND status=30 AND del=0 AND back="0"')->getField('COUNT(id)'));
		$order['finish_num'] = intval(M('order')->where('uid='.intval($uid).' AND status>30 AND del=0 AND back="0"')->getField('COUNT(id)'));
		
		$info = array();
		$program = M('program')->where('id=1')->find();
		if ($program) {
			$info['copyright'] = $program['copyright'];
		}else {
			$info['copyright'] = '© '.$program['title'];
		}
		echo json_encode(array('status'=>1,'orderInfo'=>$order,'info'=>$info));
		exit();
	}


	//***************************
	//  获取用户信息
	//***************************
	public function userinfo(){
		/*if (!$_SESSION['ID']) {
			echo json_encode(array('status'=>4));
			exit();
		}*/
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'非法操作.'));
			exit();
		}

		$user = M("user")->where('id='.intval($uid))->field('id,name,uname,photo,tel')->find();
		if ($user['photo']) {
			if ($user['source']=='') {
				$user['photo'] = __DATAURL__.$user['photo'];
			}
		}else{
			$user['photo'] = __PUBLICURL__.'home/images/moren.png';

		$user['tel'] = substr_replace($user['tel'],'****',3,4);
		echo json_encode(array('status'=>1,'userinfo'=>$user));
		exit();
		
		}
	}

	//***************************
	//  用户获取体验券信息
	//***************************
	public function ecode(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'用户信息异常.'));
			exit();
		}

		$info = M('coupons')->where('uid='.intval($uid))->find();
		if (!$info) {
			echo json_encode(array('status'=>0,'err'=>'没有找到体验券信息.'));
			exit();
		}

		$info['order_sn'] = M('order')->where('id='.intval($info['order_id']))->getField('order_sn');

		if ($info['gettime']>0) {
			$info['gettime'] = date("Y-m-d H:i:s",$info['gettime']);
		}
		if ($info['checktime']>0) {
			$info['checktime'] = date("Y-m-d H:i:s",$info['checktime']);
		}

		if ($info['offtime']>0) {
			if ($info['offtime']<time() && intval($info['state'])==1) {
				M('coupons')->where('id='.intval($info['id']))->save(array('state'=>3));
				$info['state'] = 3;
			}
			$info['offtime'] = date("Y-m-d H:i:s",$info['offtime']);
		}

		if (intval($info['state'])==1) {
			$info['desc'] = '待使用';
		}elseif (intval($info['state'])==2) {
			$info['desc'] = '已使用';
		}elseif (intval($info['state'])==3) {
			$info['desc'] = '已过期';
		}else{
			$info['desc'] = '未领取';
		}

		//获取店铺信息
		if (intval($info['shop_id'])) {
			$shop = M('exshop')->where('id='.intval($info['shop_id']))->field('name,tel,address')->find();
			$info['sname'] = $shop['name'];
			$info['tel'] = $shop['tel'];
			$info['address'] = $shop['address'];
		}

		echo json_encode(array('status'=>1,'info'=>$info));
		exit();
	}

	//**********************************
	//  判断用户是否有获取体验券
	//**********************************
	public function getcode(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0));
			exit();
		}

		$info = M('coupons')->where('uid='.intval($uid).' AND state=1')->find();
		if (!$info) {
			echo json_encode(array('status'=>0));
			exit();
		}

		$order_id = intval($_REQUEST['order_id']);
		if ($order_id==0) {
			$order_id = M('order')->where('status>10 AND back="0" AND uid='.intval($uid))->order('addtime desc,id desc')->getField('order_id');
		}

		if (!$order_id) {
			echo json_encode(array('status'=>0));
			exit();
		}

		if (intval($info['order_id'])==intval($order_id)) {
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0));
			exit();
		}

	}

	//***************************
	//  修改用户信息
	//***************************
	public function user_edit(){
			$time=mktime();
			$arr=$_POST['photo'];
			if($_POST['photo']!=''){
				$data['photo'] =$arr;
			}

			$user_id=intval($_REQUEST['user_id']);
			$old_pwd=$_REQUEST['old_pwd'];
			$pwd=$_REQUEST['new_pwd'];
			$old_tel=$_REQUEST['old_tel'];
			$uname=$_REQUEST['uname'];
			$tel=$_REQUEST['new_tel'];

			$user_info = M('user')->where('id='.intval($user_id).' AND del=0')->find();
			if (!$user_info) {
				echo json_encode(array('status'=>0,'err'=>'会员信息错误.'));
				exit();
			}

			//用户密码检测
			$data = array();
			if ($pwd) {
				$data['pwd'] = md5(md5($pwd));
				if ($user_info['pwd'] && md5(md5($old_pwd))!==$user_info['pwd']) {
					echo json_encode(array('status'=>0,'err'=>'旧密码不正确.'));
					exit();
				}
			}

			//用户手机号检测
			if ($tel) {
				if ($user_info['tel'] && $old_tel!==$user_info['tel']) {
					echo json_encode(array('status'=>0,'err'=>'原手机号不正确.'));
					exit();
				}
				$check_tel = M('user')->where('tel='.trim($tel).' AND del=0')->count();
				if ($check_tel) {
					echo json_encode(array('status'=>0,'err'=>'新手机号已存在.'));
					exit();
				}
				$data['tel'] = trim($tel);
			}

			if ($uname && $uname!==$user_info['uname']) {
				$data['uname'] = trim($uname);
			}

			if (!$data) {
				echo json_encode(array('status'=>0,'err'=>'您没有输入要修改的信息.'.__LINE__));
				exit();
			}
			//dump($data);exit;
			$result=M("user")->where('id='.intval($user_id))->save($data);
			//echo M("aaa_pts_user")->_sql();exit;
		    if($result){
				echo json_encode(array('status'=>1));
				exit();
			}else{
				echo json_encode(array('status'=>0,'err'=>'操作失败.'));
				exit();
			}
	}

	//***************************
	//  用户反馈接口
	//***************************
	public function feedback(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'登录状态异常.'));
			exit();
		}

		$con = $_POST['con'];
		if (!$con) {
			echo json_encode(array('status'=>0,'err'=>'请输入反馈内容.'));
			exit();
		}
		$data = array();
		$data['uid'] = $uid;
		$data['message'] = $con;
		$data['addtime'] = time();
		$res = M('fankui')->add($data);
		if ($res) {
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0,'保存失败！'));
			exit();
		}

	}

	//***************************
	//  用户商品收藏信息
	//***************************
	public function collection(){
		$user_id = intval($_REQUEST['id']);
		if (!$user_id) {
			echo json_encode(array('status'=>0,'err'=>'系统错误，请稍后再试.'));
			exit();
		}

		$page = intval($_REQUEST['page']);
		if (!$page) {
			$page = 1;
		}
		$limit = intval($page*10)-10;

		$pro_sc = M('product_sc');
		
		$sc_list = $pro_sc->where('uid='.intval($user_id))->order('id desc')->limit($limit.',10')->select();
		foreach ($sc_list as $k => $v) {
			$pro_info = M('product')->where('id='.intval($v['pid']).' AND del=0 AND is_down=0')->find();
			if ($pro_info) {
				$sc_list[$k]['pro_name'] = $pro_info['name'];
				$sc_list[$k]['photo'] = __DATAURL__.$pro_info['photo_x'];
				$sc_list[$k]['price_yh'] = floatval($pro_info['price_yh']);
				$sc_list[$k]['price'] = floatval($pro_info['price']);
			}else{
				$pro_sc->where('id='.intval($v['id']))->delete();
			}
		}

		echo json_encode(array('status'=>1,'sc_list'=>$sc_list));
		exit();
	}

	//***************************
	//  用户单个商品取消收藏
	//***************************
	public function collection_qu(){
	    $sc_id = intval($_REQUEST['id']);
    	if (!$sc_id) {
    		echo json_encode(array('status'=>0,'err'=>'非法操作.'));
    		exit();
    	}

		$product=M("product_sc");
	    $ress = $product->where('id ='.intval($sc_id))->delete(); 
	   //echo $shangchang->_sql();
		if($ress){
		    echo json_encode(array('status'=>1));
		    exit();
		}else{
		    echo json_encode(array('status'=>0,'err'=>'网络异常！'.__LINE__));
		    exit();
	    }
	}

	//***************************
	//  获取用户优惠券
	//***************************
	public function voucher(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'登录状态异常！'.__LINE__));
			exit();
		}

		//获取未使用或者已失效的优惠券
		$nouse = array();$nouses = array();$offdate = array();$offdates = array();
		$vou_list = M('user_voucher')->where('uid='.intval($uid).' AND status!=2')->select();
		foreach ($vou_list as $k => $v) {
			$vou_info = M('voucher')->where('id='.intval($v['vid']))->find();
			if (intval($vou_info['del'])==1 || $vou_info['end_time']<time()) {
				$offdate['vid'] = intval($vou_info['id']);
				$offdate['full_money'] = floatval($vou_info['full_money']);
				$offdate['amount'] = floatval($vou_info['amount']);
				$offdate['start_time'] = date('Y-m-d',intval($vou_info['start_time']));
				$offdate['end_time'] = date('Y-m-d',intval($vou_info['end_time']));
				$offdates[] = $offdate;
			}elseif ($vou_info['end_time']>time()) {
				$nouse['vid'] = intval($vou_info['id']);
				$nouse['shop_id'] = intval($vou_info['shop_id']);
				$nouse['title'] = $vou_info['title'];
				$nouse['full_money'] = floatval($vou_info['full_money']);
				$nouse['amount'] = floatval($vou_info['amount']);
				if ($vou_info['proid']=='all' || empty($vou_info['proid'])) {
	                $nouse['desc'] = '店内通用';
	            }else{
	                $nouse['desc'] = '限定商品';
	            }
				$nouse['start_time'] = date('Y-m-d',intval($vou_info['start_time']));
				$nouse['end_time'] = date('Y-m-d',intval($vou_info['end_time']));
				if ($vou_info['proid']) {
					$proid = explode(',', $vou_info['proid']);
					$nouse['proid'] = intval($proid[0]);
				}
				$nouses[] = $nouse;
			}
		}

		////获取已使用的优惠券
		$used = array();$useds = array();
		$vouusedlist = M('user_voucher')->where('uid='.intval($uid).' AND status=2')->select();
		foreach ($vouusedlist as $k => $v) {
			$vou_info = M('voucher')->where('id='.intval($v['vid']))->find();
			$used['vid'] = intval($vou_info['id']);
			$used['full_money'] = floatval($vou_info['full_money']);
			$used['amount'] = floatval($vou_info['amount']);
			$used['start_time'] = date('Y-m-d',intval($vou_info['start_time']));
			$used['end_time'] = date('Y-m-d',intval($vou_info['end_time']));
			$useds[] = $used;
		}

		echo json_encode(array('status'=>1,'offdates'=>$offdates,'nouses'=>$nouses,'useds'=>$useds));
		exit();
	}

	//***************************
	// 用户预订版面
	//***************************
	public function dinner() {
		//获取广告图
		$img = M('guanggao')->where('position=2')->order('sort asc,id asc')->field('id,photo')->limit(1)->find();
        $img['photo']=__DATAURL__.$img['photo'];

        //获取所有预约时间段
        $list = M('timeslot')->where('1=1 AND is_del=0')->field('id,name')->order('addtime asc')->select();

        //返回数据
        echo json_encode(array('img'=>$img,'list'=>$list,'nowtime'=>date("Y-m-d"),'offtime'=>date("Y-m-d",strtotime("+15 day"))));
        exit();
	}

	//***************************
	// 用户预订
	//***************************
	public function book() {
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'用户状态异常！'));
			exit();
		}

		$timeid = intval($_REQUEST['timeid']);
		if (!$timeid) {
			echo json_encode(array('status'=>0,'err'=>'请选择时间段！'));
			exit();
		}

		$thetime = strtotime($_POST['thetime']);
		//判断符合条件的数量
		$seatnum = M('table_boot')->where('thestarttime<='.intval($thetime).' AND theendtime>'.intval($thetime).' AND timeid='.intval($timeid))->getField('COUNT(*)');
		//获取已经预订的数量
		$booknum = M('book')->where('state=1 AND tablenum>0 AND thetime='.intval($thetime).' AND mealtime='.intval($timeid))->getField('COUNT(*)');
		if (intval($seatnum)==0 || intval($booknum)>=intval($seatnum)) {
			echo json_encode(array('status'=>0,'err'=>'没有找到该时间段下可预订的座位！'));
			exit();
		}

	    $name = trim($_REQUEST['name']);
	    $tel = trim($_REQUEST['tel']);
	    if (!$name || !$tel) {
	    	echo json_encode(array('status'=>0,'err'=>'请先完善预订信息！'));
			exit();
	    }

	    $data = array();
	    $data['uid'] = $uid;
	    $data['name'] = $name;
	    $data['tel'] = $tel;
	    $data['thetime'] = $thetime;
	    $data['mealtime'] = $timeid;
	    $data['arrive'] = trim($_POST['arrive']);
	    $data['people'] = trim($_POST['people']);
	    $data['remark'] = trim($_POST['remark']);
	    $res = M('book')->add($data);
	    if ($res) {
	    	echo json_encode(array('status'=>1,'bookId'=>$res,'thetime'=>$thetime,'timeid'=>$timeid));
			exit();
	    } else {
	    	echo json_encode(array('status'=>0,'err'=>'数据异常！'));
			exit();
	    }
	}

	//***************************
	// 用户预订 获取座位
	//***************************
	public function getseat(){
		$bookId = intval($_REQUEST['bookId']);
		$info = M('book')->where('id='.intval($bookId))->find();
		if (!$info) {
			echo json_encode(array('status'=>0,'err'=>'数据异常！'));
			exit();
		}

		$info['thedate'] = date("Y-m-d",$info['thetime']);
		$info['timedesc'] = M('timeslot')->where('id='.intval($info['mealtime']))->getField('name');

		$list = M('table_boot')->where('thestarttime<='.intval($info['thetime']).' AND theendtime>'.intval($info['thetime']).' AND timeid='.intval($info['mealtime']))->select();
		foreach ($list as $k => $v) {
			$che = M('book')->where('state=1 AND tablenum='.intval($v['id']).' AND thetime='.intval($info['thetime']).' AND mealtime='.intval($info['mealtime']))->find();
			if ($che) {
				$list[$k]['state'] = 1;
			}else{
				$list[$k]['state'] = 0;
			}
		}

		$mini = M('program')->where('id=1')->find();

		echo json_encode(array('status'=>1,'info'=>$info,'list'=>$list,'mini'=>$mini));
		exit();
	}

	//***************************
	// 用户预订 更改座位
	//***************************
	public function setseat() {
		$bookId = intval($_REQUEST['bookId']);
		$tablenum = intval($_REQUEST['tablenum']);
		if (!$bookId || !$tablenum) {
			echo json_encode(array('status'=>0,'err'=>'参数错误！'));
			exit();
		}

		$info = M('book')->where('id='.intval($bookId))->find();
		if (!$info) {
			echo json_encode(array('status'=>0,'err'=>'数据信息异常！'));
			exit();
		}

		if (intval($tablenum)==intval($info['tablenum'])) {
			echo json_encode(array('status'=>1));
			exit();
		}

		$tableinfo = M('table_boot')->where('id='.intval($tablenum))->find();

		$data = array();
		$data['tablenum'] = $tablenum;
		$res = M('book')->where('id='.intval($bookId))->save($data);
		if ($res) {
			echo json_encode(array('status'=>1));
			exit();
		} else {
			echo json_encode(array('status'=>0,'err'=>'预订失败！'));
			exit();
		}
	}

	//***************************
	// 上传认证图片
	//***************************
	public function uploadimg(){
		$info = $this->upload_images($_FILES['img'],array('jpg','png','jpeg'),"shop/auth/".date(Ymd));
		if(is_array($info)) {// 上传错误提示错误信息
			$url = 'UploadFiles/'.$info['savepath'].$info['savename'];
			$xt = $_REQUEST['imgs'];
			if ($xt) {
				$img_url = "Data/".$xt;
				if(file_exists($img_url)) {
					@unlink($img_url);
				}
			}
			echo $url;
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>$info));
			exit();
		}
	}

	/*
	*
	* 图片上传的公共方法
	*  $file 文件数据流 $exts 文件类型 $path 子目录名称
	*/
	public function upload_images($file,$exts,$path){
		$upload = new \Think\Upload();// 实例化上传类
		$upload->maxSize   =  3145728 ;// 设置附件上传大小3M
		$upload->exts      =  $exts;// 设置附件上传类型
		$upload->rootPath  =  './Data/UploadFiles/'; // 设置附件上传根目录
		$upload->savePath  =  ''; // 设置附件上传（子）目录
		$upload->saveName = time().mt_rand(100000,999999); //文件名称创建时间戳+随机数
		$upload->autoSub  = true; //自动使用子目录保存上传文件 默认为true
		$upload->subName  = $path; //子目录创建方式，采用数组或者字符串方式定义
		// 上传文件 
		$info = $upload->uploadOne($file);
		if(!$info) {// 上传错误提示错误信息
		    return $upload->getError();
		}else{// 上传成功 获取上传文件信息
			//return 'UploadFiles/'.$file['savepath'].$file['savename'];
			return $info;
		}
	}

}