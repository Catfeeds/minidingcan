<?php
namespace Api\Controller;
use Think\Controller;
class IndexController extends PublicController {
	//***************************
	//  首页数据接口
	//***************************
    public function index(){
        /***********获取首页顶部轮播图************/
        $ggtop=M('guanggao')->where('position=1')->order('sort asc,id asc')->field('id,photo')->limit(10)->select();
        foreach ($ggtop as $k => $v) {
            $ggtop[$k]['photo']=__DATAURL__.$v['photo'];
        }
        /***********获取首页顶部轮播图 end************/

        //======================
        //首页 四张图标
        //======================
        $indeximg = M('indeximg')->where('1=1')->order('sort asc')->field('name,photo,ptype')->select();
        foreach ($indeximg as $k => $v) {
            $indeximg[$k]['photo'] = __DATAURL__.$v['photo'];
        }

    	//======================
    	//首页 推荐产品10个
    	//======================
    	$prolist = M('product')->where('del=0 AND is_down=0 AND type=1')->order('sort asc,addtime desc')->field('id,name,photo_x,cid')->limit(10)->select();
    	foreach ($prolist as $k => $v) {
    		$prolist[$k]['photo_x'] = __DATAURL__.$v['photo_x'];
            $prolist[$k]['cname'] = M('pro_cat')->where('id='.intval($v['cid']))->getField('name');
    	}

        $mini = M('program')->where('id=1')->find();

        echo json_encode(array('ggtop'=>$ggtop,'indeximg'=>$indeximg,'prolist'=>$prolist,'mini'=>$mini));
        exit();
    }

    //***************************
    //  首页产品 分页
    //***************************
    public function getlist(){
        $page = intval($_REQUEST['page']);
        if (!$page) {
            $page=2;
        }
        $limit = intval($page*8)-8;

        $pro_list = M('product')->where('del=0 AND is_down=0 AND type=1')->order('sort asc,addtime desc')->field('id,name,price_yh,price,photo_x,num,is_show,is_hot')->limit($limit.',8')->select();
        foreach ($pro_list as $k => $v) {
            $pro_list[$k]['photo_x'] = __DATAURL__.$v['photo_x'];
        }

        echo json_encode(array('prolist'=>$pro_list));
        exit();
    }

    public function getcode(){
        $str = null;
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max = strlen($strPol)-1;

        for($i=0;$i<32;$i++){
            $str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
        }

        echo json_encode(array('status'=>'OK','code'=>$str));
        exit();
    }

}