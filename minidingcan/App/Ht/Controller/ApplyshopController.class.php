<?php
namespace Ht\Controller;
use Think\Controller;
class ApplyshopController extends PublicController{

	/*
	*
	* 构造函数，用于导入外部文件和公共方法
	*/
	public function _initialize(){
		$this->Applyshop = D('Applyshop_log');
		$this->Applyshop_gg = D('Applyshop_gg');
	}

	/*
	*
	* 获取、查询品牌数据
	*/
	public function index(){
		//搜索，根据广告标题搜索
		$shopname = $_REQUEST['shopname'];
		$condition = array();
		$condition['status']=0;
		$condition['is_submit']=1;
		if ($shopname) {
			$condition['shopname'] = array('LIKE','%'.$shopname.'%');
			$this->assign('name',$shopname);
		}

		//分页
		$count   = $this->Applyshop->where($condition)->count();// 查询满足要求的总记录数
		$Page    = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)

		//头部描述信息，默认值 “共 %TOTAL_ROW% 条记录”
		$Page->setConfig('header', '<li class="rows">共<b>%TOTAL_ROW%</b>条&nbsp;第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li>');
		//上一页描述信息
	    $Page->setConfig('prev', '上一页');
	    //下一页描述信息
	    $Page->setConfig('next', '下一页');
	    //首页描述信息
	    $Page->setConfig('first', '首页');
	    //末页描述信息
	    $Page->setConfig('last', '末页');
	    $Page->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');

		$show  = $Page->show();// 分页显示输出
		$user=M("user");
		$list = $this->Applyshop->where($condition)->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach ($list as $k => $v) {
			$list[$k]['submittime']=date('Y-m-d H:i:s',$v['submittime']);
			$list[$k]['user']="【".$v['uid']."】".$user->where('id='.$v['uid'])->getField('name');
		}		

		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->display(); // 输出模板

	}

	public function finishlog(){
		//搜索，根据广告标题搜索
		$shopname = $_REQUEST['shopname'];
		$condition = array();
		$condition['status']=1;
		$condition['is_submit']=1;
		if ($shopname) {
			$condition['shopname'] = array('LIKE','%'.$shopname.'%');
			$this->assign('name',$shopname);
		}

		//分页
		$count   = $this->Applyshop->where($condition)->count();// 查询满足要求的总记录数
		$Page    = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)

		//头部描述信息，默认值 “共 %TOTAL_ROW% 条记录”
		$Page->setConfig('header', '<li class="rows">共<b>%TOTAL_ROW%</b>条&nbsp;第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li>');
		//上一页描述信息
	    $Page->setConfig('prev', '上一页');
	    //下一页描述信息
	    $Page->setConfig('next', '下一页');
	    //首页描述信息
	    $Page->setConfig('first', '首页');
	    //末页描述信息
	    $Page->setConfig('last', '末页');
	    $Page->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');

		$show  = $Page->show();// 分页显示输出

		$user=M("user");
		$list = $this->Applyshop->where($condition)->limit($Page->firstRow.','.$Page->listRows)->select();
		foreach ($list as $k => $v) {
			$list[$k]['finishtime']=date('Y-m-d H:i:s',$v['finishtime']);
			$list[$k]['user']="【".$v['uid']."】".$user->where('id='.$v['uid'])->getField('name');
		}

		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->display(); // 输出模板

	}
	/**
	 * [logedit 查看详情]
	 * @return [type] [description]
	 */
	public function logedit(){
		$id=I('get.id');
		if($id){
			$applyshop=M("Applyshop_log");
			$info=$applyshop->where("id=$id")->find();
			$info['user']="【".$info['uid']."】".M('user')->where("id=".$info['uid'])->getField("name");
			$this->assign('info',$info);
			$this->display();
		}else{
			$this->error("信息有误!");
		}
	}

	public function apply_api(){
		
		if(IS_GET){
			$applyshop=M('Applyshop_log');
			$user=M("user");
			$id=I('get.id');
			$arr['status']=1;
			$arr['finishtime']=time();
			$re=$applyshop->where("id=$id")->save($arr);
			if($re){
				$info=$applyshop->where("id=$id")->field('uid,rztype')->find();
				$user->where("id=".$info['uid'])->setField("rztype",$info['rztype']);
				$this->success("审核成功!",U('Applyshop/index'));
			}else{
				$this->error("审核失败!");
			}
		}

	}
	/*
	*
	* 跳转添加或修改品牌数据页面
	*/
	public function detail(){
		//如果是修改，则查询对应广告信息
		if (intval($_GET['id'])) {
			$id = intval($_GET['id']);
		
			$Applyshop_info = $this->Applyshop->where('id='.intval($id))->find();
			$this->assign('Applyshop_info',$Applyshop_info);
		}
		$this->display();
	}


	/*
	*
	* 添加或修改申请入驻信息
	*/
	public function save(){
		//构建数组
		$this->Applyshop->create();
		//保存数据
		if (intval($_POST['id'])) {
			$result = $this->Brand->where('id='.intval($_POST['id']))->save();
		}else{
			//保存添加时间
			$this->Brand->addtime = time();
			$result = $this->Brand->add();
		}
		//判断数据是否更新成功
		if ($result) {
			$this->success('操作成功.','index');
		}else{
			$this->error('操作失败.');
		}
	}

	/*
	*
	*  入驻广告管理
	*/
	public function guanggao(){
		$adv_list=$this->Applyshop_gg->select();
		$this->assign("adv_list",$adv_list);
		$this->display();
	}

	/*
	*
	* 添加或修改广告信息
	*/
	public function ggsave(){
		//构建数组
		if(IS_POST){
			$this->Applyshop_gg->create();
			//上传广告图片
			if (!empty($_FILES["file"]["tmp_name"])) {
				//文件上传
				$info = $this->upload_images($_FILES["file"],array('jpg','png','jpeg'),'applyshopgg/'.date(Ymd));
			    if(!is_array($info)) {// 上传错误提示错误信息
			        $this->error($info);
			    }else{// 上传成功 获取上传文件信息
				    $this->Applyshop_gg->photo = 'UploadFiles/'.$info['savepath'].$info['savename'];
				    //生成国定大小的缩略图
				    if (intval($_POST['adv_id'])) {
						$check_url = $this->Applyshop_gg->where('id='.intval($_POST['adv_id']))->getField('photo');
						$url = "Data/".$check_url;
						if (file_exists($url) && $check_url) {
							@unlink($url);
						}
					}
			    }
			}

			//保存数据
			$this->Applyshop_gg->addtime = time();
			$result = $this->Applyshop_gg->where('id='.intval($_POST['adv_id']))->save();
			//判断数据是否更新成功
			if ($result) {
				$this->success('操作成功.',U('Applyshop/guanggao'));
			}else{
				$this->error('操作失败.');
			}
		}else{
			$adv_info = $this->Applyshop_gg->where("id=".I('get.adv_id'))->find();
			$this->assign("adv_info",$adv_info);
			$this->display();
		}
		
	}
	/**
     * [makeshop 一键生成店铺]
     * @return [type] [description]
     */
    public function makeshop(){
        $id=I("get.id");
        if(!$id){
            $this->error("非法操作!");
            exit;
        }
        //查询通过的记录
        $log=M("applyshop_log")->where("status=1 AND id=$id")->find();
        $data['name']=$log['shopname'];
        @$checkshopname=M("shangchang")->where("name='".$data['name']."'")->getField("id");
        if($checkshopname){
        	$this->error("该店铺名称已经存在！");
        	exit;
        }
        $data['uname']=$log['linkman'];
        $data['utel']=$log['tel'];
        $data['content']=$log['digest'];
        $data['addtime']=time();
        $data['logo']=$log['logo'];
        $re=M("shangchang")->add($data);
        if($re){
        	M("user")->where("id=".$log['uid'])->setField(array("shop_id"=>$re,"shop_status"=>1,"pwd"=>md5(md5('888888'))));
        	M("applyshop_log")->where("id=$id")->setField("is_makeshop",1);
        	$this->success("生成成功!");
        }else{
        	$this->error("生成失败!");
        }

    }
    /**
     * [rzset 认证费用设置]
     * @return [type] [description]
     */
    public function rzset(){
    	$program=M("program");
    	if(IS_POST){
    		$post=I("post.");
    		$data['is_free']=$post['is_free'];
    		$data['fee']=$post['fee'];
    		$re=$program->where("id=1")->save($data);
    		if($re){
    			$this->success("保存成功!");
    		}else{
    			$this->error("保存失败!");
    		}
    	}else{
    		$v=$program->where("id=1")->field('is_free,fee')->find();
    		$this->assign("v",$v);
    		$this->display();
    	}	
    }
    public function del(){
    	$id=I("request.id");
    	$applyshop=M("applyshop_log");
    	if($id){
    		//修改对应的显示状态
			$re = $this->Brand->where('id='.$id)->setField("is_submit",0);
			if ($re) {
				$this->success('操作成功.','index');
			}else{
				$this->error('操作失败.');
			}
    	}
    }
	


}