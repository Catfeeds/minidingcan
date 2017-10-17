<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Think\Controller;
class ActivityController extends PublicController {
    //*****************************
    //  商家活动列表
    //*****************************
    public function index(){
        $keyword=$_POST['keyword'];
        $where = '1=1';
        if ($keyword) {
            $where .=' AND name LIKE "%'.$keyword.'%"';
        }

        $list = M('activity')->where($where)->field('id,digest,name,photo')->order('sort desc,addtime desc')->limit(8)->select();
        foreach ($list as $k => $v) {
            $list[$k]['photo']=__DATAURL__.$v['photo'];
        }
        //json加密输出
        echo json_encode(array('list'=>$list));
        exit();
    }

    //*****************************
    //  商家活动  加载更多
    //*****************************
    public function getlist(){
        $page = intval($_REQUEST['page']);
        if (!$page) {
            $page = 2;
        }
        $limit = $page*8-8;

        $list = M('activity')->where($where)->field('id,digest,name,photo')->order('sort desc,addtime desc')->limit($limit.',8')->select();
        foreach ($list as $k => $v) {
            $list[$k]['photo']=__DATAURL__.$v['photo'];
        }
        //json加密输出
        //dump($json);
        echo json_encode(array('list'=>$list));
        exit();
    }

    //*****************************
    //  商家活动详情
    //*****************************
    public function detail(){
        $id=intval($_REQUEST['id']);
        $detail=M('activity')->where('id='.intval($id))->find();
        if (!$detail) {
            echo json_encode(array('status'=>0,'err'=>'没有找到相关信息.'));
            exit();
        }

        $up = array();
        $up['click'] = intval($detail['click'])+1;
        M('activity')->where('id='.intval($id))->save($up);

        $content = str_replace(C('content.dir'), __DATAURL__, $detail['content']);
        $detail['content']=html_entity_decode($content, ENT_QUOTES, "utf-8");

        $detail['addtime'] = date("Y-m-d",$detail['addtime']);

        echo json_encode(array('status'=>1,'info'=>$detail));
        exit();
    }
    
}