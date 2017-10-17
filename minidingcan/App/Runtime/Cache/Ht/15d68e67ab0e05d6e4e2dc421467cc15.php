<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/minidingcanapi/Public/ht/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/ht/css/jquery.datetimepicker.css"/>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/action.js"></script>
<style>
.dx1{float:left; margin-left: 17px; margin-bottom:10px; }
.dx2{color:#090; font-size:16px;  border-bottom:1px solid #CCC; width:100% !important; padding-bottom:8px;}
.dx3{width:120px; margin:5px auto; border-radius: 2px; border: 1px solid #b9c9d6; display:block;}
.dx4{border-bottom:1px solid #eee; padding-top:5px; width:100%;}
</style>
</head>
<body>

<div class="aaa_pts_show_1">【 时间段设置 】</div>

<div class="aaa_pts_show_2">
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('index');?>">时间段管理</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('add');?>">添加时间段</a></div>
    </div>
    <div class="aaa_pts_3">
		<form action="<?php echo U('add');?>" method="post" onsubmit="return ac_from();">
		<ul class="aaa_pts_5">
			<li>
				<div class="d1">时间段:</div>
				<div>
					<input class="inp_1" name="name" id="name" value="<?php echo ($info["name"]); ?>"/>
				</div>
			</li>
      <li><input type="submit" name="submit" value="提交" class="aaa_pts_web_3" border="0" id="aaa_pts_web_s">
          <input type="hidden" name="id" id='id' value="<?php echo ($info["id"]); ?>">
      </li>
      </ul>
      </form>
         
    </div>
    
</div>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/product.js"></script>
<script>
function ac_from(){

  var name=document.getElementById('name').value;
  if(name.length<1){
	  alert('时间段不能为空');
	  return false;
	} 
  
}

</script>
</body>
</html>