<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Think\Controller;
class ShoppingController extends PublicController {

	//***************************
	//  会员获取购物车列表接口
	//***************************
	public function index(){
        $shopping=M("shopping_char");
        $product=M("product");
		$user_id = intval($_REQUEST['user_id']);
		if (!$user_id) {
			echo json_encode(array('status'=>0));
			exit();
		}

		$page = intval($_REQUEST['page']);
		if (!$page) {
			$page = 1;
		}
		$limit = intval($page*8)-8;

		$cart = $shopping->where('uid='.intval($user_id))->field('id,uid,pid,price,num,buff,type')->limit($limit.',8')->select();
        foreach ($cart as $k => $v) {
        	$pro_info = $product->where('id='.intval($v['pid']))->field('name,photo_x')->find();
        	$cart[$k]['pro_name']=$pro_info['name'];
        	$cart[$k]['photo_x']=__DATAURL__.$pro_info['photo_x'];
        	//修改变动价格
			$ggbuff = trim($v['buff'],',');
			if ($ggbuff && $ggbuff!='') {
				//获取不同属性价格库存
				$gg = $this->getprice(intval($v['pid']),$ggbuff);
				if ($gg['status']>0) {
					$price = floatval($gg['price']);
					$stock = intval($gg['stock']);
					$data = array();
					if (intval($v['num'])>$stock) {
						$data['num'] = $stock;
						$cart[$k]['num'] = $stock;
					}
					if(floatval($v['price'])!=$price){
						$data['price'] = $price;
						$cart[$k]['price'] = $price;
					}
					if ($data) {
						$shopping->where('id='.intval($v['id']))->save($data);
					}
				}
			}
        }

		echo json_encode(array('status'=>1,'cart'=>$cart));
		exit();
    }

	//购物车商品删除
	public function delete(){
		$shopping=M("shopping_char");
		$cart_id=intval($_REQUEST['cart_id']);
		$check_id = $shopping->where('id='.intval($cart_id))->getField('id');
		if (!$check_id) {
			echo json_encode(array('status'=>1));
			exit();
		}

	    $res = $shopping->where('id ='.intval($cart_id))->delete(); // 删除
		if($res){
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0));
			exit();
		}
	}

	//***************************
	//  会员修改购物车数量接口
	//***************************
	public function up_cart(){
		$shopping=M("shopping_char");
		$uid = intval($_REQUEST['user_id']);
		$cart_id = intval($_REQUEST['cart_id']);
		$ctype=$_REQUEST['ctype'];

		if (!$uid || !$cart_id || !$ctype) {
			echo json_encode(array('status'=>0,'err'=>'操作数据异常.'.__LINE__));
			exit();
		}

		$check = $shopping->where('id='.intval($cart_id))->find();
		$thenum = intval($check['num']);
		if ($ctype=='jian') {
			if (!$check) {
				echo json_encode(array('status'=>0,'err'=>'购物车信息错误！'));
				exit();
			}
			$num = $thenum-1;
		} else {
			$num = $thenum+1;
		}

		if ($num<=0) {
			$res = $shopping->where('id='.intval($cart_id))->delete();
			if ($res) {
				echo json_encode(array('status'=>1));
				exit();
			}else{
				echo json_encode(array('status'=>0,'err'=>'参数错误！'));
				exit();
			}
		}

		//检测产品表库存
		if ($ctype=='jia') {
			$pro_num = M('product')->where('id='.intval($check['pid']))->getField('num');
			if($num>intval($pro_num)){
				echo json_encode(array('status'=>0,'err'=>'库存不足！UP_FAILED'));
				exit();
			}
		}

		//检测规格表库存
		// $ggattr = trim($check['buff'],',');
		// if ($ggattr && $ggattr!='') {
		// 	//获取不同属性价格库存
		// 	$gg = $this->getprice(intval($check['pid']),$ggattr);
		// 	if ($gg['status']>0) {
		// 		$stock = intval($gg['stock']);
		// 		if($num>intval($stock)){
		// 			echo json_encode(array('status'=>0,'err'=>'库存不足！FAILED'));
		// 			exit();
		// 		}
		// 	}
		// }
		
		$data=array();
		$data['num']=intval($num);

		$res = $shopping->where('id ='.intval($cart_id).' AND uid='.intval($uid))->save($data);
		if ($res) {
			echo json_encode(array('status'=>1,'succ'=>'操作成功!'));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'操作失败.'));
			exit();
		}
		
	}

	//多个购物车商品删除
	public function qdelete(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'网络异常，请稍后再试.'));
			exit();
		}
		$shopping=M("shopping_char");
		$cart_id=trim($_REQUEST['cart_id'],',');
		if (!$cart_id) {
			echo json_encode(array('status'=>0,'err'=>'网络错误，请稍后再试.'));
			exit();
		}

	    $res = $shopping->where('id in ('.$cart_id.') AND uid='.intval($uid))->delete(); // 删除
		if($res){
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'操作失败.'));
			exit();
		}
	}


	//添加购物车
	public function add(){
		$uid = intval($_REQUEST['uid']);
		if (!$uid) {
			echo json_encode(array('status'=>0,'err'=>'登录状态异常.'));
			exit();
		}

		$pid = intval($_REQUEST['pid']);
		$num = intval($_REQUEST['num']);
		if (!intval($pid)) {
			echo json_encode(array('status'=>0,'err'=>'参数错误.'));
			exit();
		}

		//加入购物车
		$check = $this->check_cart(intval($pid));
		if ($check['status']==0) {
			echo json_encode(array('status'=>0,'err'=>$check['err']));
			exit;
		}

		$check_info = M('product')->where('id='.intval($pid).' AND del=0 AND is_down=0')->find();
		$attr = trim($_POST['attr'],',');
		if ($attr && $attr!='') {
			//获取不同属性价格库存
			$gg = $this->getprice($pid,$attr);
			if ($gg['status']>0) {
				$check_info['num'] = intval($gg['stock']);
				$check_info['price_yh'] = floatval($gg['price']);
			}
		}

		//判断库存
		if (intval($check_info['num'])<=$num) {
			echo json_encode(array('status'=>0,'err'=>'库存不足！'));
			exit;
		}

		$shpp=M("shopping_char");

		//判断购物车内是否已经存在该商品
		$data = array();
		$cart_info = $shpp->where('pid='.intval($pid).' AND uid='.intval($uid).' AND buff="'.$attr.'"')->field('id,num')->find();
		if ($cart_info) {
			$data['num'] = intval($cart_info['num'])+intval($num);
			//判断库存
			if (intval($check_info['num'])<=$data['num']) {
				echo json_encode(array('status'=>0,'err'=>'库存不足！'));
				exit;
			}

			if (floatval($check_info['price_yh'])!=floatval($cart_info['price'])) {
				$data['price'] = floatval($check_info['price_yh']);
			}

			if (isset($_REQUEST['ptype']) && $_REQUEST['ptype']=='buynow') {
				$data['num'] = intval($num);
			}
			if (intval($data['num'])==intval($cart_info['num'])) {
				$res = 1;
			} else {
				$res = $shpp->where('id='.intval($cart_info['id']))->save($data);
			}
			$cart_id = intval($cart_info['id']);
		}else{
			$data['pid']=intval($pid);
			$data['num']=intval($num);
			$data['addtime']=time();
			$data['uid']=intval($uid);
			$data['shop_id']=intval($check_info['shop_id']);
			$ptype = 1;
			if (intval($check_info['pro_type'])) {
				$ptype = intval($check_info['pro_type']);
			}
			$data['buff'] = $attr;
			$data['type']=$ptype;
			$data['price'] = $check_info['price_yh'];

			$res=$shpp->add($data);
			$cart_id = $res;
		}

		if($res){
			echo json_encode(array('status'=>1,'cart_id'=>$cart_id)); //该商品已成功加入您的购物车
			exit;
		}else{
			echo json_encode(array('status'=>0,'err'=>'加入失败.'));
			exit;
		}
	}

	public function checkprotype(){
		$cart_id = trim($_REQUEST['cartid'],',');
		$id = explode(',',$cart_id);
		if (count($id)>1) {
			foreach ($id as $k => $v) {
				$arr[] = M('shopping_char')->where('id='.intval($v))->getField('type');
			}
			$arrs = array_unique($arr);//合并相同的元素
			if (count($arrs)>1) {
				echo json_encode(array('status'=>0));
				exit();
			}
		}
		
		echo json_encode(array('status'=>1));
		exit();
	}

	//***************************
	//  会员立即购买下单接口
	//***************************
	public function check_shop(){
		$cart_id = trim($_REQUEST['cart_id'],',');
		$id=explode(',',$cart_id);
		if (!$cart_id) {
			echo json_encode(array('status'=>0));
			exit();
		}

		foreach ($id as $k=>$v){
			$shoop[$k]=M("shopping_char")->where('id ='.intval($v))->field('shop_id,pid')->find();
        }

		foreach($shoop as $key => $value){
			$result[$key] = M("product")->where('id='.intval($value['pid']))->field('id,price,price_yh')->select();
			$price[] = i_array_column($result[$key], 'price_yh');
		}
		//dump($price);exit;
		foreach($price as $keys => $va){
			$str .= implode(",", $va).",";
		}
		$str = trim($str, ",");
		$parr = explode(",", $str);
		if(array_sum($parr) && in_array("0", $parr)){
			echo json_encode(array('status'=>0));
			exit();
		}
		
		$names = i_array_column($shoop, 'shop_id');
		
		$arr=array_unique($names);
		$val= sizeof($arr);
		if($val=='1'){
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>2));
			exit();
		}	 
	}

	//购物车添加。删除检测公共方法
	public function check_cart($pid){
		//检查产品是否存在或删除
		$check_info = M('product')->where('id='.intval($pid).' AND del=0 AND is_down=0')->find();
		if (!$check_info) {
			return array('status'=>0,'err'=>'商品不存在或已下架.');
		}

		return array('status'=>1);
	}   

    //**********************************
	//  会员商品 属性价格库存获取
	//**********************************
    public function getprice($pid,$attr){
    	$pid = intval($pid);
    	$info = trim($attr,',');
    	if (!$pid || !$info) {
    		return array('status'=>0);
    	}

    	$attrs = array();
    	$attrs = explode(',', $info);
    	$price = array();$stock = array();
    	foreach ($attrs as $k => $v) {
    		$gg = M('guige')->where('pid='.intval($pid).' AND name="'.$v.'"')->find();
    		$attr_id = M('attribute')->where('id='.intval($gg['attr_id']).' AND pro_id='.intval($pid))->getField('id');
    		if (!$gg || !intval($attr_id)) {
    			return array('status'=>0);
    		}
    		$price[] = floatval($gg['price']);
    		$stock[] = intval($gg['stock']);
    	}

    	rsort($price);
    	sort($stock);
    	$theprice = sprintf("%.2f",$price[0]);
    	$thestock = $stock[0];
    	return array('status'=>1,'price'=>$theprice,'stock'=>intval($thestock));
    	exit();
    }

}