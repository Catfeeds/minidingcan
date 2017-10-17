<?php
namespace Api\Controller;
use Think\Controller;
class WebController extends PublicController {
	//***************************
	//  所有单页数据接口
	//***************************
    public function web(){
    	$web_id = intval($_REQUEST['web_id']);
    	$content = M('web')->where('id='.intval($web_id))->getField('concent');
        $content = str_replace(C('content.dir'), __DATAURL__, $content);
    	$content = html_entity_decode($content, ENT_QUOTES, "utf-8");
		echo urldecode(json_encode(array('status'=>1,'content'=>$content)));
    }

    //***************************
	//  获取中心认证图片接口
	//***************************
    public function vip_char(){
    	
    	$pic = M('admin_app')->getField('photo');
    	$pic = "http://".$_SERVER['SERVER_NAME'].__DATA__.'/'.$pic;
    	echo json_encode(array('pic'=>$pic));
    	exit();
    }

    //***************************
    //  产品商家搜索接口
    //***************************
    public function searches(){
        //print_r(__PHOTOURL__);die();
        $keyword = trim($_REQUEST['keyword']);
        if (!$keyword) {
            echo json_encode(array('status'=>0,'err'=>'请输入搜索内容.'));
            exit();
        }

        $page=intval($_REQUEST['page']);
        if (!$page) {
            $page=0;
        }

        $prolist = M('product')->where('del=0 AND is_down=0 AND name LIKE "%'.$keyword.'%"')->order('addtime desc')->field('id,name,photo_x,shiyong,renqi,price,price_yh,company')->limit($page.',15')->select();
        foreach ($pro_list as $k => $v) {
            $prolist[$k]['photo_x'] = __PHOTOURL__.$v['photo_x'];
        }

        $page2=intval($_REQUEST['page2']);
        if (!$page2) {
            $page2=0;
        }

        $condition = array();
        $condition['status']=1;
        //根据店铺名称查询
        $condition['name']=array('LIKE','%'.$keyword.'%');
        //获取所有的商家数据
        $store_list = M('shangchang')->where($condition)->order('sort desc,type desc')->field('id,name,uname,logo,tel,sheng,city,quyu')->limit($page2.',6')->select();
        foreach ($store_list as $k => $v) {
            $store_list[$k]['sheng'] = M('china_city')->where('id='.intval($v['sheng']))->getField('name');
            $store_list[$k]['city'] = M('china_city')->where('id='.intval($v['city']))->getField('name');
            $store_list[$k]['quyu'] = M('china_city')->where('id='.intval($v['quyu']))->getField('name');
            $store_list[$k]['logo'] = __PHOTOURL__.$v['logo'];
            $pro_list = M('product')->where('del=0 AND is_down=0 AND shop_id='.intval($v['id']))->field('id,photo_x,price_yh')->limit(4)->select();
            foreach ($pro_list as $key => $val) {
                $pro_list[$key]['photo_x'] = __PHOTOURL__.$val['photo_x'];
            }
            $store_list[$k]['pro_list'] = $pro_list;
        }

        echo json_encode(array('status'=>1,'pro'=>$prolist,'shop'=>$store_list));
        exit();
    }

    //***************************
    //  获取app主题颜色接口
    //***************************
    public function getcolor(){
        $colors = M('admin_app')->where('pid=29')->getField('theme_color');
        if ($colors) {
            echo json_encode(array('status'=>1,'colors'=>$colors));
            exit();
        }else{
            echo json_encode(array('status'=>0));
            exit();
        }
    }
}