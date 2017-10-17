<?php
// |++++++++++++++++++++++++++++++++++++++++
// |-综合管理
// |---单页管理(lr_web)
// |---用户反馈(lr_fankui)
// |---首页设置
// |------首页banner(lr_guanggao)
// |------新闻栏目设置(lr_config)
// |------推荐分类(lr_category)
// |------推荐产品(lr_product)
// |------推荐商家(lr_shangchang)
// |---城市管理(lr_china_city)
// |+++++++++++++++++++++++++++++++++++++++++
namespace Ht\Controller;
use Think\Controller;
class MoreController extends PublicController{
	//*************************
	//单页设置
	//*************************
	public function pweb_gl(){
		//获取web表的数据进行输出
		$model=M('web');
		$list=$model->select();
		//dump($list);exit;
		//=================
		//将变量进行输出
		//=================
		$this->assign('list',$list);	
		$this->display();
	}

	//*************************
	//单页设置修改
	//*************************
	public function pweb(){
		if(IS_POST){
			if(intval($_POST['id'])){
				$data = array();
				$data['concent'] = $_POST['concent'];
				$data['sort'] = intval($_POST['sort']);
				$data['addtime'] = time();
				$up = M('web')->where('id='.intval($_POST['id']))->save($data);
				if ($up) {
					$this->success('保存成功！');
					exit();
				}else{
					$this->error('操作失败！');
					exit();
				}

			}else{
				$this->error('系统错误！');
				exit();
			}
		}else{
			$this->assign('datas',M('web')->where(M('web')->getPk().'='.I('get.id'))->find());
			$this->display();
		}
	}

	//*************************
	//用户反馈
	//*************************
	public function fankui(){
		//获取搜索框发送过来的数据
		if(!empty($_GET)){
			//dump(I('get.'));exit;
			$message=$this->htmlentities_u8($_GET['message']);
			if($_GET['type']=='del'){
				$this->delete('fankui',(int)$_GET['id']);
			}
		}
		//ajax删除fankui数据表的数据
		//拼装sql语句

		//dump($tsql);exit;
		//搜索
		$where="1=1";
		$message!='' ? $where.=" and message like '%$message%'" : null;
		//dump($tsql);exit;
		//=========================
		//define  每页显示的数量
		//=========================
		define('rows',20);
		$count=M('fankui')->where($where)->count();
		$rows=ceil($count/rows);
		$page=(int)$_GET['page'];
		$page<0?$page=0:'';
		$limit=$page*rows;
		$page_index=$this->page_index($count,$rows,$page);
		$fankui=M('fankui')->where($where)->order('id desc')->limit($limit,rows)->select();
		//=============
		//将变量输出
		//=============
		$this->assign('id',$id);
		$this->assign('message',$message);
		$this->assign('page_index',$page_index);
		$this->assign('fankui',$fankui);
		$this->display();
	}

	

	//*************************
	//城市管理
	//*************************
	public function city(){
		$id=(int)$_GET['id'];
		//一级列表
		$city=M('ChinaCity')->where("tid=".$id)->select();
		foreach ($city as $k => $v) {
			$city[$k]['priv']=$v['tid']<1 ? '省级' : M('ChinaCity')->where('id='.$v['tid'])->getField('name');
		}
		//dump($city);exit;
		//省市区面包屑，此调用函数在楼下
		$nav=$id>0 ? $this->city_jibie($id) : NULL;
		//dump($_GET);
		//如果有GET到type=del就执行删除
		if($_GET['type']=='del'){
			$this->delete('ChinaCity',$id);
		}
		
		//=============
		//将变量输出
		//=============
		$this->assign('id',$id);
		$this->assign('city',$city);
		$this->assign('nav',$nav);
		$this->display();
	}

	//*************************
	//城市管理  面包屑功能
	//*************************
	public function city_jibie($id){
	   $re=M('ChinaCity')->field('name,tid,id')->where('id='.$id)->find();
	   //dump($re);
	   $text = '<a href="?id='.$re['id'].'">'.$re['name'].'</a>';
	   if($re['tid']>0){
		   $text = $this->city_jibie($re['tid']) .' -> '. $text;   
	   }
	   return $text;
	}


	//*************************
	//城市管理  添加下级县市
	//*************************
	public function city_add(){
		//这是点击添加下级是获取
	    $tid=(int)$_GET['tid'];
	    //这是点击修改时获取
		$id=(int)$_GET['id'];
		$priv=M('ChinaCity')->where('id='.$tid)->find();
		$city=M('ChinaCity')->where('id='.$id)->find();
		//dump($priv);
		//修改时获取post过来的东西，然后进行判断插入或者更新
		if($_POST['submit']){
			 //dump($_POST);exit;
			  $array = array(
			             'tid' => $tid ,
						 'name' => $this->htmlentities_u8($_POST['name']) ,
			               );
			  //此处为添加下级
			  if($id<1)
			  {
				 $id =M('ChinaCity')->add($array);
				 echo '<script>alert("操作成功！");location="?tid='.$tid.'&id='.$id.'";</script>';
			  }else{
			  	 //此处为修改
				 $sql = M('ChinaCity')->where('id='.$id)->save($array);  
			  }
			  //修改后的后续行为
			  if($sql){			  
				  echo '<script>alert("操作成功！");location="?tid='.$tid.'&id='.$id.'";</script>';
			   }else{
				  echo '<script>alert("操作失败！");history.go(-1);</script>';
			   }
			  
		}
		//此处为添加新的下级的后续操作
		if($id>0){
		  $tid = M('ChinaCity')->where('id='.$id)->getField('tid');
		}
		//=============
		//将变量输出
		//=============
		$this->assign('id',$id);
		$this->assign('priv',$priv);
		$this->assign('city',$city);
		$this->display();
	}

	//*************************
	// 新闻栏目设置
	//*************************
	public function new_option(){
		$id=(int)$_GET['id'];
		$option=$_GET['option'];
		if($_POST['submit']==true){
		   
		   try{
			   
			   $array['sort']=(int)$_POST['sort'];
			   $array['name']=$this->htmlentities_u8($_POST['name']);
			   $array['photo']=$this->htmlentities_u8($_POST['photo']);
			   $array= array(
						'pid' => (int)$_POST['pid'],
						'sort' => (int)$_POST['sort'],
						'key' => $this->htmlentities_u8($_POST['key']),
						'val' => $this->htmlentities_u8($_POST['val']),
						  );
				foreach ($array as $k => $v) {
					if(!$v){
						unset($array[$k]);
					}
				}	  
				if(strlen($array['val'])!=6){
					throw new \Exception('颜色不正确！');
				}
			   
				$sql=M('config')->where("id=$id")->save($array);
				
				if(!$sql) throw new \Exception('操作失败！');
				
				echo '<script>
						  alert("操作成功！");
						  location.href="new_option?id='.$id.'"
						  window.opener.location.reload();
					   </script>';
			
		   }catch(\Exception $e){
			   echo '<script>
				      alert("'.$e->getMessage().'");
					  history.go(-1);
				    </script>';
		   }
		   return ;
		}

		if($option=="more"){
			$more="more";//设置标示
		}else{$more="";}
		$config= $id>0 ? M('config')->where("id=$id")->find() : ""; 
		//将栏目分类遍历出来
		$newscat= M('category')->where('tid=23')->select();
		foreach ($newscat as $k => $v) {
		  $config['pid']==$v['id'] ? $select="selected=selected" : $select="";
		  $newscat[$k]['id'] = "value='".$v['id']."' $select";  
		}
		//dump($newscat);exit;
		//=============
		//将变量输出
		//=============
		$this->assign('id',$id);
		$this->assign('config',$config);
		$this->assign('more',$more);
		$this->assign('newscat',$newscat);
		$this->display();
	}

	//*************************
	// 小程序配置 设置页面
	//*************************
	public function setup(){
		if(IS_POST){
			//构建数组
			M('program')->create();
			//上传产品分类缩略图
			if (!empty($_FILES["file2"]["tmp_name"])) {
				//文件上传
				$info2 = $this->upload_images($_FILES["file2"],array('jpg','png','jpeg'),"logo");
			    if(!is_array($info2)) {// 上传错误提示错误信息
			        $this->error($info2);
			    }else{// 上传成功 获取上传文件信息
				    M('program')->logo = 'UploadFiles/'.$info2['savepath'].$info2['savename'];
			    }
			}
			M('program')->uptime=time();

			$check = M('program')->where('id=1')->getField('id');
			if (intval($check)) {
				$up = M('program')->where('id=1')->save();
			}else{
				M('program')->id=1;
				$up = M('program')->add();
			}

			if ($up) {
				$this->success('保存成功！');
				exit();
			}else {
				$this->error('操作失败！');
				exit();
			}
			
		}else{
			$this->assign('info',M('program')->where('id=1')->find());
			$this->display();
		}

	}
	//*************************
	// 首页图标 设置
	//*************************
	public function indeximg(){
		$list = M('indeximg')->where('1=1')->order('sort asc')->select();

		$this->assign('list',$list);
		$this->display();
	}

	//*************************
	// 首页图标 设置
	//*************************
	public function addimg(){
		$info = M('indeximg')->where('id='.intval($_REQUEST['id']))->find();

		//获取所有二级分类
		// $procat = M('category')->where('tid=1')->field('id,name')->select();
		// foreach ($procat as $k => $v) {
		// 	$procat[$k]['list'] = M('category')->where('tid='.intval($v['id']))->field('id,name')->select();
		// }

		$this->assign('info',$info);
		//$this->assign('procat',$procat);
		$this->display();
	}

	//*************************
	// 首页图标 设置
	//*************************
	public function saveimg(){
		$id = intval($_REQUEST['id']);
		if (!$id) {
			$this->error('参数错误');
			exit();
		}

		$data = array();
		//上传产品分类缩略图
		if (!empty($_FILES["file"]["tmp_name"])) {
			//文件上传
			$info = $this->upload_images($_FILES["file"],array('jpg','png','jpeg'),"category/indeximg");
			if(!is_array($info)) {// 上传错误提示错误信息
				$this->error($info);
				exit();
			}else{// 上传成功 获取上传文件信息
				$data['photo'] = 'UploadFiles/'.$info['savepath'].$info['savename'];
				$xt = M('indeximg')->where('id='.intval($id))->field('photo')->find();
				if (intval($id) && $xt['photo']) {
					$img_url = "Data/".$xt['photo'];
					if(file_exists($img_url)) {
						@unlink($img_url);
					}
				}
			}
		}
		if (trim($_POST['name'])) {
			$data['name'] = trim($_POST['name']);
		}
		if (intval($_POST['ptype'])) {
			$data['ptype'] = intval($_POST['ptype']);
		}

		$data['sort'] = intval($_POST['sort']);
		$res = M('indeximg')->where('id='.intval($id))->save($data);
		if ($res) {
			$this->success('保存成功！','indeximg');
			exit();
		}else{
			$this->error('操作失败！');
			exit();
		}
	}

}