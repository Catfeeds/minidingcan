<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Think\Controller;
class CategoryController extends PublicController {
	//***************************
	// 产品分类
	//***************************
    public function index(){
    	$list = M('pro_cat')->where('del=0')->field('id,name')->select();
        foreach ($list as $k => $val) {
           $pro = M('product')->where('del=0 AND cid='.intval($val['id']))->field('id,name,price_yh,photo_x,salenum,renqi')->select();
           foreach ($pro as $key => $v) {
               $pro[$key]['photo_x'] = __DATAURL__.$v['photo_x'];
               $pro[$key]['cartnum'] = 0;
               $pro[$key]['cartid'] = 0;
               if (intval($_REQUEST['uid'])) {
                    $cartinfo = M('shopping_char')->where('uid='.intval($_REQUEST['uid']).' AND pid='.intval($v['id']))->find();
                    $pro[$key]['cartnum'] = intval($cartinfo['num']);
                    $pro[$key]['cartid'] = intval($cartinfo['id']);
               }
           }
           $list[$k]['list'] = $pro;
        }

        $cartnum = 0;
        $cartmoney = 0;
        $cartlist = array();
        if (intval($_REQUEST['uid'])) {
            $cartlist = M('shopping_char')->where('uid='.intval($_REQUEST['uid']))->select();
            if ($cartlist) {
                foreach ($cartlist as $k => $v) {
                    $cartlist[$k]['name'] = M('product')->where('id='.intval($v['pid']))->getField('name');
                    $cartlist[$k]['photo'] = __DATAURL__.M('product')->where('id='.intval($v['pid']))->getField('photo_x');
                    $cartmoney += floatval($v['price']*$v['num']);
                    $cartnum += intval($v['num']);
                }
            }
        }

        $fee = M('program')->where('1=1')->getField('yunfei');

    	//json加密输出
		echo json_encode(array('list'=>$list,'cartlist'=>$cartlist,'cartnum'=>$cartnum,'cartmoney'=>sprintf("%.2f",$cartmoney),'fee'=>floatval($fee)));
        exit();
    }

    //***************************
    // 产品分类
    //***************************
    public function getcat(){
        $catid = intval($_REQUEST['cat_id']);
        if (!$catid) {
            echo json_encode(array('status'=>0,'err'=>'没有找到产品数据.'));
            exit();
        }

        $catList = M('category')->where('tid='.intval($catid))->field('id,name,bz_1')->select();
        foreach ($catList as $k => $v) {
            $catList[$k]['bz_1'] = __DATAURL__.$v['bz_1'];
        }

        //json加密输出
        //dump($json);
        echo json_encode(array('status'=>1,'catList'=>$catList));
        exit();
    }

}