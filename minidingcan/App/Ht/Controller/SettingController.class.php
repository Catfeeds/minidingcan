<?php
namespace Ht\Controller;
use Think\Controller;
class SettingController extends PublicController{
	//**********************************************
	//说明：时间段列表管理 
	//**********************************************
	public function set_time(){

		$list=M('timeslot')->where('1=1 AND is_del=0')->order('addtime asc')->select();

		$this->assign('list',$list);
		$this->display();
	}

	//**********************************************
	//说明：时间段 添加修改
	//**********************************************
	public function add(){
		if (IS_POST) {
			$id = intval($_POST['id']);
			$name = trim($_REQUEST['name']);
			if (!$name) {
				$this->error('时间段不能为空!');
				exit();
			}

			$data = array();
			$data['name'] = $name;
			if ($id>0) {
				$res = M('timeslot')->where('id='.intval($id))->save($data);
			}else{
				$data['addtime'] = time();
				$res = M('timeslot')->add($data);
			}
			if ($res) {
				$this->success('保存成功！');
				exit();
			}else{
				$this->error('操作失败！');
				exit();
			}
		}

		$info = M('timeslot')->where('id='.intval($_REQUEST['id']))->find();
		$this->assign('info',$info);
		$this->display();
	}


	//***************************
	//说明：时间段 删除
	//***************************
	public function del()
	{
		$id = intval($_REQUEST['did']);
		$info = M('timeslot')->where('id='.intval($id))->find();
		if (!$info) {
			$this->error('时间段信息错误.'.__LINE__);
			exit();
		}

		if (intval($info['is_del'])==1) {
			$this->success('操作成功！.'.__LINE__);
			exit();
		}

		$data=array();
		$data['is_del'] = $info['is_del'] == '1' ?  0 : 1;
		$up = M('timeslot')->where('id='.intval($id))->save($data);
		if ($up) {
			$this->redirect('set_time');
			exit();
		}else{
			$this->error('操作失败.');
			exit();
		}
	}

	//**********************************************
	//说明：座位预定列表管理 
	//**********************************************
	public function set_seat(){
		//分页
		$count   = M('table_boot')->where('1=1')->count();// 查询满足要求的总记录数
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

		$boot_list = M('table_boot')->where('1=1')->limit($Page->firstRow.','.$Page->listRows)->order('addtime desc')->select();
		foreach ($boot_list as $k => $v) {
			$boot_list[$k]['thestarttime'] = date("Y-m-d",$v['thestarttime']);
			$boot_list[$k]['theendtime'] = date("Y-m-d",$v['theendtime']);
			$boot_list[$k]['starttime'] = date("H:i",$v['starttime']);
			$boot_list[$k]['endtime'] = date("H:i",$v['endtime']);
			$boot_list[$k]['timeslot'] = M('timeslot')->where('id='.intval($v['timeid']))->getField('name');
		}

		$this->assign('boot_list',$boot_list);
		$this->assign('page',$show);
		$this->display(); // 输出模板
	}

	//**********************************************
	//说明：时间段 添加修改
	//**********************************************
	public function add_seat(){
		if (IS_POST) {
			$id = intval($_POST['id']);
			$timeid = intval($_POST['timeid']);
			$stime = strtotime($_POST['thestarttime']);
			$etime = strtotime($_POST['theendtime']);
			if (!intval($stime) || !intval($etime)) {
				$this->error('请正确设置开放预订日期！');
				exit();
			}

			if ($stime<time() || $etime<time()) {
				$this->error('开放预订日期必须大于当前时间！');
				exit();
			}

			if ($stime>=$etime) {
				$this->error('结束日期必须大于开始日期！');
				exit();
			}

			$tablenum = $_POST['tablenum'];
			if ($tablenum) {
				foreach ($tablenum as $k => $v) {
					$data = array();
					$data['thestarttime'] = $stime;
					$data['theendtime'] = $etime;
					$data['timeid'] = $timeid;
					$data['longtime'] = $_POST['longtime'][$k];
					$data['tablenum'] = $v;
					$data['tabletype'] = $_POST['tabletype'][$k];
					$data['people'] = $_POST['people'][$k];
					$data['price'] = $_POST['price'][$k];
					$data['addtime'] = time();
					$res = M('table_boot')->add($data);
				}
				if ($res) {
					$this->success('保存成功！','set_seat');
					exit();
				} else {
					$this->error('操作失败！');
					exit();
				}
			}else{
				$this->error('没有找到更新数据！');
				exit();
			}
		}

		//获取每天的预订时间段
		$list = M('timeslot')->where('is_del=0')->select();
		$this->assign('list',$list);

		$info = M('table_boot')->where('id='.intval($_REQUEST['id']))->find();
		$this->assign('info',$info);
		$this->display();
	}

	//***************************
	//说明：座位信息 删除
	//***************************
	public function del_seat()
	{
		$id = intval($_REQUEST['did']);
		$info = M('table_boot')->where('id='.intval($id))->find();
		if (!$info) {
			$this->error('数据错误.'.__LINE__);
			exit();
		}

		if (intval($info['del'])==1) {
			$this->success('操作成功！.'.__LINE__);
			exit();
		}

		$data=array();
		$data['del'] = $info['del'] == '1' ?  0 : 1;
		$up = M('table_boot')->where('id='.intval($id))->save($data);
		if ($up) {
			$this->redirect('set_seat');
			exit();
		}else{
			$this->error('操作失败.');
			exit();
		}
	}
}