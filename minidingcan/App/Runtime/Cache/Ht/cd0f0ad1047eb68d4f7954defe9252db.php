<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
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
<title>我的桌面</title>
</head>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎进入小程序管理系统</p>
	<p>用户名：<?php echo $_SESSION["admininfo"]['name'] ?> </p>
	<p>登录IP：<?php echo ($ip); ?>  </p>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th colspan="7" scope="col">信息统计</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<!-- <th>店铺</th> -->
				<th>产品</th>
				<th>用户</th>
				<th>订单</th>
				<!-- <th>品牌</th> -->
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<!-- <td><?php echo ($shopnum); ?></td> -->
				<td><?php echo ($productnum); ?></td>
				<td><?php echo ($usernum); ?></td>
				<td><?php echo ($ordernum); ?></td>
				<!-- <td><?php echo ($brandnum); ?></td> -->
			</tr>
			<tr class="text-c">
				<td>今日</td>
				<!-- <td><?php echo ($today_shopnum); ?></td> -->
				<td><?php echo ($today_productnum); ?></td>
				<td><?php echo ($today_usernum); ?></td>
				<td><?php echo ($today_ordernum); ?></td>
				<!-- <td><?php echo ($today_brandnum); ?></td> -->
			</tr>
			<tr class="text-c">
				<td>本月</td>
				<!-- <td><?php echo ($thismonth_shopnum); ?></td> -->
				<td><?php echo ($thismonth_productnum); ?></td>
				<td><?php echo ($thismonth_usernum); ?></td>
				<td><?php echo ($thismonthorder); ?></td>
				<!-- <td><?php echo ($thismonth_brandnum); ?></td> -->
			</tr>
		</tbody>
	</table>
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">销售统计</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">今日销售额</th>
				<td><span id="lbServerName">￥<?php echo ($today_money); ?></span></td>
			</tr>
			<tr>
				<td>本月销售额</td>
				<td>￥<?php echo ($thismonthmoney); ?></td>
			</tr>
		</tbody>
	</table>
</div>
<footer class="footer mt-20">
	<div class="container">
		<p>leren &copy 2017</p>
	</div>
</footer>
<script type="text/javascript" src="/minidingcanapi/Public/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/minidingcanapi/Public/hui/static/h-ui/js/H-ui.min.js"></script> 
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