<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/minidingcanapi/Public/ht/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/action.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/plugins/xheditor/xheditor-1.2.1.min.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/plugins/xheditor/xheditor_lang/zh-cn.js"></script>
</head>
<body>

<div class="aaa_pts_show_1">【 广告管理 】</div>

<div class="aaa_pts_show_2">
    
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('index');?>">全部广告</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('add');?>">添加广告</a></div>
    </div>
    <div class="aaa_pts_3">
      <form action="<?php echo U('save');?>" method="post" onsubmit="return ac_from();" enctype="multipart/form-data">
      <ul class="aaa_pts_5">
         <li>
            <div class="d1">广告标题:</div>
            <div>
              <input class="inp_1" name="name" id="name" value="<?php echo $adv_info['name']; ?>"/>
            </div>
         </li>
         <li>
            <div class="d1">显示位置:</div>
            <div>
               <select class="inp_1" id="position" name="position">
                  <!-- <option value="">无</option> -->
                  <option value="1" <?php echo $adv_info['position']==1 ? 'selected="selected"' : NULL; ?>>&nbsp;- 首页轮播</option>
                  <option value="2" <?php echo $adv_info['position']==2 ? 'selected="selected"' : NULL; ?>>&nbsp;- 座位预订页</option>
               </select>
            </div>
         </li>
		     <li>
            <div class="d1">跳转事件:</div>
            <div>
               <select class="inp_1" id="type" name="type">
                  <option value="">无</option>
                  <option value="index" <?php echo $adv_info['type']=='index' ? 'selected="selected"' : NULL; ?>>首页</option>
                  <!-- <option value="product" <?php ?>>产品</option>
                  <option value="partner" <?php ?>>店铺</option> -->
               </select>
            </div>
         </li>
         <li>
            <div class="d1">事件值:</div>
            <div>
              <input class="inp_1" name="action" id="action" value="<?php echo $adv_info['action']; ?>"/> 
              &nbsp;&nbsp;<span style="color:red;font-size: 12px;">跳转事件为首页时，无需填写 商品、新闻、商铺请填写相应的id值。</span>
            </div>
         </li>
        <span style="color:red;font-size: 12px;margin-left:1%;">轮播图大小：390*180；预订页：420*212，前台只显示一张</span>
         <li data-index="" style="margin-top:10px;">

            <div class="d1">广告图片:</div>
            <div>
             <input type="hidden" name="photo" id="photo" value="<?php echo $adv_info['photo']; ?>"/>
              <?php if ($adv_info['photo']) { ?>
              <img src="/minidingcanapi/Data/<?php echo $adv_info['photo']; ?>" width="200" height="100" /><br /><br />
              <?php } ?>
              <input type="file" name="file" id="file" value="">
            </div>
         </li>
         <li>
            <div class="d1">排序:</div>
            <div>
              <input class="inp_1" name="sort" id="sort" value="<?php echo $adv_info['sort']; ?>"/> 
            </div>
         </li>
         <li><input type="submit" name="submit" value="提交" class="aaa_pts_web_3" border="0" >
            <input type="hidden" name="adv_id" id="adv_id" value="<?php echo $adv_info['id']; ?>">
         </li>
      </ul>
      </form>
         
    </div>
    
</div>
<script>
function ac_from(){
  var name=document.getElementById('name').value;
  if(name.length<2){
	  alert('广告标题长度不能少于2');
	  return false;
	  } 
}
</script>
</body>
</html>