<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/hui/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title><?php echo ($_SESSION['system']['sysname']); ?>-小程序管理后台</title>

</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml"><?php echo ($_SESSION['system']['sysname']); ?></a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">V2.0</span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="product_add('添加资讯','<?php echo U('Product/add');?>')"><i class="Hui-iconfont">&#xe620;</i> 产品</a></li>
                            <!-- <li><a href="javascript:;" onclick="product_add('添加店铺','<?php echo U('Shangchang/add');?>')"><i class="Hui-iconfont">&#xe620;</i> 店铺</a></li> -->
					</ul>
				</li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>欢迎您：</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A"><?php echo ($_SESSION['admininfo']['name']); ?><i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="<?php echo U('Login/logout');?>">退出</a></li>
				</ul>
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
	   <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i>&nbsp;&nbsp;综合管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('More/pweb_gl');?>" data-title="前台管理" href="javascript:void(0)">前台管理</a></li>
                    <li><a data-href="<?php echo U('More/indeximg');?>" data-title="首页图标设置" href="javascript:void(0)">首页图标设置</a></li>
                    <li><a data-href="<?php echo U('More/setup');?>" data-title="小程序配置" href="javascript:void(0)">小程序配置</a></li>
            </ul>
        </dd>
    </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe62d;</i>&nbsp;&nbsp;会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('User/index');?>" data-title="会员管理" href="javascript:void(0)">会员管理</a></li>
            </ul>
        </dd>
    </dl>
        
        <!-- <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp&nbsp店铺管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Shangchang/add');?>" data-title="添加店铺" href="javascript:;">添加店铺</a></li>
                    <li><a data-href="<?php echo U('Shangchang/index');?>" data-title="店铺管理" href="javascript:void(0)">店铺管理</a></li>
            </ul>
        </dd>
    </dl> -->
        <!-- <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp&nbsp实名认证管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Applyshop/index');?>" data-title="待审核" href="javascript:;">待审核</a></li>
                    <li><a data-href="<?php echo U('Applyshop/finishlog');?>" data-title="已审核" href="javascript:;">已审核</a></li>
                    <li><a data-href="<?php echo U('Applyshop/guanggao');?>" data-title="入驻广告设置" href="javascript:;">店铺保证金广告</a></li>
                    <li><a data-href="<?php echo U('Applyshop/rzset');?>" data-title="认证费用设置" href="javascript:;">认证费用设置</a></li>
            </ul>
        </dd>
    </dl> -->
    <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;菜单分类管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('ProCat/add');?>" data-title="添加分类" href="javascript:void(0)">添加分类</a></li>
                    <li><a data-href="<?php echo U('ProCat/index');?>" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
            </ul>
        </dd>
    </dl>
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;菜单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Product/add');?>" data-title="添加菜单" href="javascript:void(0)">添加菜单</a></li>
                    <li><a data-href="<?php echo U('Product/index');?>" data-title="菜单管理" href="javascript:void(0)">菜单管理</a></li>
            </ul>
        </dd>
    </dl>

    <dl id="menu-admin">
        <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;预订设置管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
        <dd>
            <ul>
                <li><a data-href="<?php echo U('Setting/set_time');?>" data-title="时间段设置" href="javascript:void(0)">时间段设置</a></li>
                <li><a data-href="<?php echo U('Setting/set_seat');?>" data-title="预订座位设置" href="javascript:void(0)">预订座位设置</a></li>
            </ul>
        </dd>
    </dl>
    <!-- <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp&nbsp抢购产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Panic/add');?>" data-title="添加抢购产品" href="javascript:void(0)">添加抢购产品</a></li>
                    <li><a data-href="<?php echo U('Panic/index');?>" data-title="抢购产品管理" href="javascript:void(0)">抢购产品管理</a></li>
            </ul>
        </dd>
    </dl> -->
    <!-- <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp&nbsp品牌管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Brand/add');?>" data-title="添加品牌" href="javascript:void(0)">添加品牌</a></li>
                    <li><a data-href="<?php echo U('Brand/index');?>" data-title="品牌管理" href="javascript:void(0)">品牌管理</a></li>
            </ul>
        </dd>
    </dl> -->
    </dl>
    <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Order/index');?>" data-title="全部订单" href="javascript:void(0)">全部订单</a></li>
            </ul>
        </dd>
    </dl>
    </dl>
    
    <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;优惠券管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Voucher/add');?>" data-title="添加优惠券" href="javascript:void(0)">添加优惠券</a></li>
                    <li><a data-href="<?php echo U('Voucher/index');?>" data-title="优惠券管理" href="javascript:void(0)">优惠券管理</a></li>
            </ul>
        </dd>
    </dl>
    <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;活动管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
            <ul>
                <li><a data-href="<?php echo U('Activity/add');?>" data-title="添加活动" href="javascript:void(0)">添加活动</a></li>
                <li><a data-href="<?php echo U('Activity/index');?>" data-title="活动管理" href="javascript:void(0)">活动管理</a></li>
            </ul>
        </dd>
    </dl>
    <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i>&nbsp;&nbsp;广告管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Guanggao/index');?>" data-title="广告管理" href="javascript:void(0)">广告管理</a></li>
                    <li><a data-href="<?php echo U('Guanggao/add');?>" data-title="添加广告" href="javascript:void(0)">添加广告</a></li>
            </ul>
        </dd>
    </dl>
    <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe62d;</i>&nbsp;&nbsp;管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="<?php echo U('Adminuser/add');?>" data-title="添加管理员" href="javascript:void(0)">添加管理员</a></li>
                    <li><a data-href="<?php echo U('Adminuser/adminuser');?>" data-title="管理员管理" href="javascript:void(0)">管理员管理</a></li>
            </ul>
        </dd>
    </dl>	
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome.html">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="<?php echo U('Index/welcome');?>"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/minidingcanapi/Public/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/minidingcanapi/Public/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/minidingcanapi/Public/hui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/
});
/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: '<div>管理员信息</div>'
	});
}

/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}


</script> 

<!--此乃百度统计代码，请自行删除-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<!--/此乃百度统计代码，请自行删除-->
</body>
</html>