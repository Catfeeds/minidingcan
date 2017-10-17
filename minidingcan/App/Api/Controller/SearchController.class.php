<?php
namespace Api\Controller;
use Think\Controller;
class SearchController extends PublicController {
	//***************************
	//  获取会员 搜索记录接口
	//***************************
    public function index(){
    	$uid = intval($_REQUEST['uid']);
    	//获取热门搜索内容
        $remen = M('search_record')->group('keyword')->field('keyword')->order('SUM(num) desc')->limit(10)->select();
        //获取历史搜索记录
        $history = array();
        if ($uid) {
            $history = M('search_record')->where('uid='.intval($uid))->order('addtime desc')->field('keyword')->limit(20)->select();
        }
        echo json_encode(array('remen'=>$remen,'history'=>$history));
        exit();
    }

    //***************************
    //  产品商家搜索接口
    //***************************
    public function searches(){
        $uid = intval($_REQUEST['uid']);

        $keyword = trim($_REQUEST['keyword']);
        if (!$keyword) {
            echo json_encode(array('status'=>0,'err'=>'请输入搜索内容.'));
            exit();
        }

        if ($uid) {
            $check = M('search_record')->where('uid='.intval($uid).' AND keyword="'.$keyword.'"')->find();
            if ($check) {
               $num = intval($check['num'])+1;
               M('search_record')->where('id='.intval($check['id']))->save(array('num'=>$num));
            }else{
               $add = array();
               $add['uid'] = $uid;
               $add['keyword'] = $keyword;
               $add['addtime'] = time();
               M('search_record')->add($add);
            }
        }

        $page=intval($_REQUEST['page']);
        if (!$page) {
            $page=1;
        }
        $limit = intval($page*8)-8;

        $prolist = M('product')->where('del=0 AND pro_type=1 AND name LIKE "%'.$keyword.'%"')->order('addtime desc')->field('id,name,photo_x,num,price,price_yh,is_show,is_hot')->limit($limit.',8')->select();
        foreach ($prolist as $k => $v) {
            $prolist[$k]['photo_x'] = __DATAURL__.$v['photo_x'];
        }

        echo json_encode(array('status'=>1,'pro'=>$prolist));
        exit();
    }


}