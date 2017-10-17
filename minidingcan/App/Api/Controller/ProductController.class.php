<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Think\Controller;
class ProductController extends PublicController {
	//***************************
	//  获取商品详情信息接口
	//***************************
    public function index(){
		$product=M("product");

		$pro_id = intval($_REQUEST['pro_id']);
		if (!$pro_id) {
			echo json_encode(array('status'=>0,'err'=>'参数错误！'));
			exit();
		}
		
		$pro = $product->where('id='.intval($pro_id).' AND del=0 AND is_down=0')->find();
		if(!$pro){
			echo json_encode(array('status'=>0,'err'=>'菜单不存在或已下架！'.__LINE__));
			exit();
		}

		$pro['photo_x'] =__DATAURL__.$pro['photo_x'];
		$pro['photo_d'] = __DATAURL__.$pro['photo_d'];

		//图片轮播数组
		$img = explode(',',trim($pro['photo_string'],','));
		$b=array();
		if ($pro['photo_string']) {
			foreach ($img as $k => $v) {
				$b[] = __DATAURL__.$v;
			}
		}else{
			$b[] = $pro['photo_d'];
		}
		$pro['img_arr']=$b;//图片轮播数组

		echo json_encode(array('status'=>1,'pro'=>$pro));
		exit();

	}

	//***************************
	//  获取 预售商品列表接口
	//***************************
   	public function lists(){
 		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		// $id=44;
 		$type=I('post.orders');//排序类型

 		$page= intval($_POST['page']) ? intval($_POST['page']) : 0;
 		$keyword=I('post.keyword');
 		//排序
 		$order="sort asc,shiyong desc,addtime asc";//默认按添加时间排序
 		if($type=='dsale'){
 			//销量降序
 			$order="shiyong desc";
 		}elseif($type=='asale'){
 			//销量升序
 			$order="shiyong asc";
 		}elseif($type=='aprice'){
 			//价格升序
 			$order="price_yh asc";
 		}elseif($type=='dprice'){
 			//价格降序
 			$order="price_yh desc";
 		}elseif($type=='atime'){
 			//时间降序
 			$order="addtime desc";
 		}
 		//条件
 		$where="pro_type=1 AND del=0 AND is_down=0";
 		if(intval($id)){
 			//判断是不是一级分类，是则查询该分类下的所有二级分类id
 			$tid = M('category')->where('id='.intval($id))->field('id,tid')->find();
 			if (intval($tid['tid'])==1) {
 				$ids = M('category')->where('tid='.intval($tid['id']))->field('id')->select();
 				$arr = array();
 				foreach ($ids as $k => $v) {
 					$arr[] = $v['id'];
 				}
 				$arrstr = implode($arr, ',');
 				$where.=" AND cid IN (".$arrstr.")";
 			}else{
 				$where.=" AND cid=".intval($id);
 			}
 		}

 		if($keyword && $keyword!='undefined') {
            $where.=' AND name LIKE "%'.$keyword.'%"';
        }

 		$product=M('product')->where($where)->order($order)->limit($page.',8')->select();
 		//echo M('product')->_sql();exit;
 		$json = array();$json_arr = array();
 		foreach ($product as $k => $v) {
 			$json['id']=$v['id'];
 			$json['name']=$v['name'];
 			$json['photo_x']=__DATAURL__.$v['photo_x'];
 			$json['price']=$v['price'];
 			$json['price_yh']=$v['price_yh'];
 			$json['shiyong']=$v['shiyong'];
 			$json['company']=$v['company'];
 			$json['intro']=$v['intro'];
 			$json['is_show'] = intval($v['is_show']);
 			$json['is_hot'] = intval($v['is_hot']);
 			$json_arr[] = $json;
 		}
 		$cat_name=M('category')->where("id=".intval($id))->getField('name');
 		echo json_encode(array('status'=>1,'pro'=>$json_arr,'cat_name'=>$cat_name));
 		exit();
    }

    //*******************************
	//  商品列表页面 获取更多接口
	//*******************************
    public function get_more(){
 		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		// $id=44;
 		$type=I('post.orders');//排序类型

 		$page= intval($_POST['page']);
 		if (!$page) {
 			$page=1;
 		}
 		$limit = intval($page*8)-8;

 		$keyword=I('post.keyword');
 		//排序
 		$order="sort asc,shiyong desc,addtime asc";//默认按添加时间排序
 		if($type=='dsale'){
 			//销量降序
 			$order="shiyong desc";
 		}elseif($type=='asale'){
 			//销量升序
 			$order="shiyong asc";
 		}elseif($type=='aprice'){
 			//价格升序
 			$order="price_yh asc";
 		}elseif($type=='dprice'){
 			//价格降序
 			$order="price_yh desc";
 		}elseif($type=='atime'){
 			//时间降序
 			$order="addtime desc";
 		}
 		//条件
 		$where="pro_type=1 AND del=0 AND is_down=0";
 		if(intval($id)){
 			//判断是不是一级分类，是则查询该分类下的所有二级分类id
 			$tid = M('category')->where('id='.intval($id))->field('id,tid')->find();
 			if (intval($tid['tid'])==1) {
 				$ids = M('category')->where('tid='.intval($tid['id']))->field('id')->select();
 				$arr = array();
 				foreach ($ids as $k => $v) {
 					$arr[] = $v['id'];
 				}
 				$arrstr = implode($arr, ',');
 				$where.=" AND cid IN (".$arrstr.")";
 			}else{
 				$where.=" AND cid=".intval($id);
 			}
 		}

 		if($keyword && $keyword!='undefined') {
            $where.=' AND name LIKE "%'.$keyword.'%"';
        }

 		$product=M('product')->where($where)->order($order)->limit($limit.',8')->select();
 		//echo M('product')->_sql();exit;
 		$json = array();$json_arr = array();
 		foreach ($product as $k => $v) {
 			$json['id']=$v['id'];
 			$json['name']=$v['name'];
 			$json['photo_x']=__DATAURL__.$v['photo_x'];
 			$json['price']=$v['price'];
 			$json['price_yh']=$v['price_yh'];
 			$json['shiyong']=$v['shiyong'];
 			$json['intro']=$v['intro'];
 			$json['is_show'] = intval($v['is_show']);
 			$json['is_hot'] = intval($v['is_hot']);
 			$json_arr[] = $json;
 		}

 		echo json_encode(array('pro'=>$json_arr));
 		exit();
    }

    //*******************************
	//  商品列表页面 获取更多接口
	//*******************************
    public function getcatpro(){
 		$json="";
 		$id=intval($_POST['cat_id']);//获得分类id 这里的id是pro表里的cid
 		$page= intval($_POST['page']);
 		if (!$page) {
 			$page=1;
 		}
 		$limit = intval($page*8)-8;

 		//排序
 		$order="sort asc,shiyong desc,addtime asc";//默认按添加时间排序
 		//条件
 		$where="pro_type=1 AND del=0 AND is_down=0";
 		if(intval($id)){
 			//判断是不是一级分类，是则查询该分类下的所有二级分类id
 			$tid = M('category')->where('id='.intval($id))->field('id,tid')->find();
 			if (intval($tid['tid'])==1) {
 				$ids = M('category')->where('tid='.intval($tid['id']))->field('id')->select();
 				$arr = array();
 				foreach ($ids as $k => $v) {
 					$arr[] = $v['id'];
 				}
 				$arrstr = implode($arr, ',');
 				$where.=" AND cid IN (".$arrstr.")";
 			}else{
 				$where.=" AND cid=".intval($id);
 			}
 		}

 		$product=M('product')->where($where)->order($order)->limit($limit.',8')->select();
 		$json = array();$json_arr = array();
 		foreach ($product as $k => $v) {
 			$json['id']=$v['id'];
 			$json['name']=$v['name'];
 			$json['photo_x']=__DATAURL__.$v['photo_x'];
 			$json['price']=$v['price'];
 			$json['price_yh']=$v['price_yh'];
 			$json['num']=$v['num'];
 			$json['intro']=$v['intro'];
 			$json['is_show'] = intval($v['is_show']);
 			$json['is_hot'] = intval($v['is_hot']);
 			$json_arr[] = $json;
 		}

 		//获取该分类下的推荐产品
 		$info = array();
 		$catimg = M('catimg')->where('cat_id='.intval($id).' AND state=1')->find();
 		if ($catimg) {
 			$pro_id = intval($catimg['pro_id']);
 			$proinfo = M('product')->where('id='.intval($pro_id))->field('name,intro')->find();
 			$info['pro_id'] = $pro_id;
 			$info['pro_name'] = $proinfo['name'];
 			$info['intro'] = $proinfo['intro'];
 			//处理图片
 			$imgarr = array();
 			if ($catimg['img_str']!='') {
 				$img = explode(',', trim($catimg['img_str'],','));
	 			foreach ($img as $val) {
	 				$imgarr[] = __DATAURL__.$val;
	 			}
 			}
 			$info['img'] = $imgarr;
 		}

 		$concent = M('category')->where('id='.intval($id))->getField('concent');
 		echo json_encode(array('pro'=>$json_arr,'info'=>$info,'con'=>$concent));
 		exit();
    }

    //**********************************
	//  会员商品 属性价格库存获取
	//**********************************
    public function getprice(){
    	$pid = intval($_REQUEST['pid']);
    	$info = trim($_REQUEST['attrs'],',');
    	if (!$pid || !$info) {
    		echo json_encode(array('status'=>0));
			exit();
    	}

    	$attrs = array();
    	$attrs = explode(',', $info);
    	$price = array();$stock = array();
    	foreach ($attrs as $k => $v) {
    		$gg = M('guige')->where('pid='.intval($pid).' AND name="'.$v.'"')->find();
    		$attr_id = M('attribute')->where('id='.intval($gg['attr_id']).' AND pro_id='.intval($pid))->getField('id');
    		if (!$gg || !intval($attr_id)) {
    			echo json_encode(array('status'=>0));
				exit();
    		}
    		$price[] = floatval($gg['price']);
    		$stock[] = intval($gg['stock']);
    	}

    	rsort($price);
    	sort($stock);
    	$theprice = sprintf("%.2f",$price[0]);
    	$thestock = $stock[0];
    	echo json_encode(array('status'=>1,'price'=>$theprice,'stock'=>intval($thestock)));
    	exit();
    }

	//***************************
	//  会员商品收藏接口
	//***************************
	public function col(){
		$uid = intval($_REQUEST['uid']);
		$pid = intval($_REQUEST['pid']);
		if (!$uid || !$pid) {
			echo json_encode(array('status'=>0,'err'=>'系统错误，请稍后再试.'));
			exit();
		}

		$check = M('product_sc')->where('uid='.intval($uid).' AND pid='.intval($pid))->getField('id');
		if ($check) {
			$res = M('product_sc')->where('id='.intval($check))->delete();
		}else{
			$data = array();
			$data['uid'] = intval($uid);
			$data['pid'] = intval($pid);
			$res = M('product_sc')->add($data);
		}
		
		if ($res) {
			echo json_encode(array('status'=>1));
			exit();
		}else{
			echo json_encode(array('status'=>0,'err'=>'网络错误..'));
			exit();
		}
	}


}