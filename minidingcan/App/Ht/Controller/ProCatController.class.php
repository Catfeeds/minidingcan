<?php
namespace Ht\Controller;
use Think\Controller;
class ProCatController extends PublicController{

	/*
	*
	* 构造函数，用于导入外部文件和公共方法
	*/
	public function _initialize() {

	}

	/*
	*
	* 获取、查询栏目表数据
	*/
	public function index(){
		$list = M('pro_cat')->where('1=1 AND del=0')->field('id,name,sort,type')->select();

		$this->assign('list',$list);
		$this->display(); // 输出模板
	}


	/*
	*
	* 跳转添加或修改栏目页面
	*/
	public function add(){
		//如果是修改，则查询对应分类信息
		if (intval($_GET['cid'])) {
			$cate_id = intval($_GET['cid']);
		
			$cate_info = M('pro_cat')->where('id='.intval($cate_id))->find();
			if (!$cate_info) {
				$this->error('没有找到相关信息.');
			}
			$this->assign('cate_info',$cate_info);
		}
		$this->display();
	}


	/*
	*
	* 添加或修改栏目信息
	*/
	public function save(){

		//构建数组
		M('pro_cat')->create();
		//上传产品分类缩略图
		if (!empty($_FILES["file2"]["tmp_name"])) {
			//文件上传
			$info2 = $this->upload_pic($_FILES["file2"],array('jpg','png','jpeg'),"category/".date(Ymd));
		    if(!is_array($info2)) {// 上传错误提示错误信息
		        $this->error($info2);
		        exit();
		    }else{// 上传成功 获取上传文件信息
			    M('pro_cat')->img = 'UploadFiles/'.$info2['savepath'].$info2['savename'];
		    }
		}
		//保存数据
		if (intval($_POST['cid'])) {
			$result = M('pro_cat')->where('id='.intval($_POST['cid']))->save();
		}else{
			M('pro_cat')->addtime = time();
			$result = M('pro_cat')->add();
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
	*  设置栏目推荐
	*/
	public function set_tj(){
		$tj_id = intval($_GET['tj_id']);
		$cate_info = M('pro_cat')->where('id='.intval($tj_id))->find();
		if (!$cate_info) {
			$this->error('分类信息错误.');
			exit();
		}
		$data=array();
		$data['type'] = $cate_info['type'] == '1' ?  0 : 1;
		$up = M('pro_cat')->where('id='.intval($tj_id))->save($data);
		if ($up) {
			$this->success('操作成功.');
		}else{
			$this->error('操作失败.');
		}
	}

	/*
	*
	* 栏目删除
	*/
	public function del(){
		//以后删除还要加权限登录判断
		$id = intval($_GET['did']);
		$cate_info = M('pro_cat')->where('id='.intval($id))->find();
		if (!$cate_info) {
			$this->error('分类信息错误.');
			exit();
		}
		if (intval($cate_info['del'])==1) {
			$this->redirect('index');
			exit();
		}
		$data=array();
		$data['del'] = $cate_info['del'] == '1' ?  0 : 1;
		$up = M('pro_cat')->where('id='.intval($id))->save($data);
		if ($up) {
			$this->redirect('index');
		}else{
			$this->error('操作失败.');
		}
	}


	/*
	*
	* 图片上传的公共方法
	*  $file 文件数据流 $exts 文件类型 $path 子目录名称
	*/
	private function upload_pic($file,$exts,$path){
		$upload = new \Think\Upload();// 实例化上传类
		$upload->maxSize   =  2097152 ;// 设置附件上传大小2M
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