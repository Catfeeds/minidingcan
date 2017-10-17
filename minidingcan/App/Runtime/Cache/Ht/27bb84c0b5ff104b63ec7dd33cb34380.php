<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/minidingcanapi/Public/ht/css/main.css?253" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/minidingcanapi/Public/ht/css/jquery.datetimepicker.css"/>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery.js"></script>
<style>
.dx1{float:left; margin-left: 17px; margin-bottom:10px; }
.dx2{color:#090; font-size:16px;  border-bottom:1px solid #CCC; width:100% !important; padding-bottom:8px;}
.dx3{width:120px; margin:5px auto; border-radius: 2px; border: 1px solid #b9c9d6; display:block;}
.dx4{border-bottom:1px solid #eee; padding-top:5px; width:100%;}
</style>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery-1.8.3.min.js"></script>
<script src="/minidingcanapi/Public/ht/js/jquery.date.js"></script>
<script src="/minidingcanapi/Public/ht/js/jquery.datetimepicker.js"></script>
<script type="text/javascript">
$(function(){
　　$('#thestarttime').datetimepicker({
      format:'Y-m-d H:00',
      formatDate:'Y-m-d H:00',
    });
    $('#theendtime').datetimepicker({
      format:'Y-m-d H:00',
      formatDate:'Y-m-d H:00',
    });
    $('#datetimepicker').datetimepicker({
      format:'Y-m-d H:00',
      formatDate:'Y-m-d H:00',
    });
    $('#datetimepicker2').datetimepicker({
      format:'Y-m-d H:00',
      formatDate:'Y-m-d H:00',
    });
}); 

</script>
</head>
<body>

<div class="aaa_pts_show_1">【 座位预订设置 】</div>

<div class="aaa_pts_show_2">
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('set_seat');?>">全部座位</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('add_seat');?>">添加座位</a></div>
    </div>
    <div class="aaa_pts_3">
      <form action="<?php echo U('add_seat');?>" method="post" onsubmit="return ac_from();">
      <ul id="ul" class="aaa_pts_5">
        <li class="product"><div class="d1 dx2">预订信息</div></li>
        <li>
            <div class="d1">开放预订日期:</div>
            <div>
              <input type="text" class="inp_1 inp_6" name="thestarttime" id="thestarttime" value="<?php echo $info['thestarttime']=='' ? date('Y-m-d H:00',strtotime('+1 hour')) : $info['thestarttime']; ?>" onfocus="getdate();" />&nbsp;-&nbsp;
              <input type="text" class="inp_1 inp_6" name="theendtime" id="theendtime" value="<?php echo $info['theendtime']=='' ? date('Y-m-d H:00',strtotime('+1 day +1 hour')) : $info['theendtime']; ?>" onfocus="getdate();" />
              <!-- <span style="color:red;margin-left:5px;">&nbsp;* 请把开始时间设置大于当前时间</span> -->
            </div>
         </li>
         <li>
            <div class="d1">时间段:</div>
            <div>
              <select class="inp_1" name="timeid" id="timeid" style="width:200px;margin-right:5px;">
                <!-- 遍历 -->
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><option value="<?php echo ($v["id"]); ?>" <?php if($v["id"] == $info['timeid']): ?>selected="selected"<?php endif; ?>>-- <?php echo ($v["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                <!-- 遍历 -->
              </select>
              <span id="catedesc" style="color:red;font-size: 12px;">&nbsp;&nbsp; * 必选项</span>
            </div>
         </li>
         <div id="divs">
          
         </div>
         <li class="product" style="padding-top:10px;">
           <button type="button" style="display:none;" id="button2" onclick="del_info();">－删除座位</button>
           <button type="button" style='margin-top:5px;' id="button1" onclick="chk_info();">＋添加座位</button>
         </li>
         <li><input type="submit" name="submit" value="提交" class="aaa_pts_web_3" style="width: 100px;height: 35px;" border="0">
         	<input type="hidden" name="id" value="<?php echo ($info["id"]); ?>" />
         </li>
      </ul>
      </form>
         
    </div>
    
</div>
<script>
function chk_info(){
  var checkbox = $("#divs").children().length;
  var info = '<div style="border:1px solid #E0E0E0;margin-top:10px 0;padding-top:10px;"><li class="product"><div class="d1">餐桌号:</div><div><input class="inp_1" style="width:120px;" name="tablenum['+checkbox+']" value="" /></div></li><li class="product"><div class="d1">餐桌类型:</div><div><input class="inp_1" style="width:120px;" name="tabletype['+checkbox+']" /><span style="color:green;margin-left:5px;">&nbsp;* 三人座、五人座、大厅、包间...</span></div></li><li class="product"><div class="d1">可坐人数:</div><div><input class="inp_1" style="width:120px;" name="people['+checkbox+']" /></div></li><li class="product"><div class="d1">座位预留时间:</div><div><input class="inp_1" style="width:120px;" name="longtime['+checkbox+']" /><span style="color:green;margin-left:5px;">&nbsp;* 单位：小时</span></div></li><li class="product"><div class="d1">预订金:</div><div><input class="inp_1" style="width:120px;" name="price['+checkbox+']" /><span style="color:green;margin-left:5px;">&nbsp;* 不填或填0，表示免费预订</span></div></li></div>';
    $('#button2').css('display','block');
    $('#divs').append(info);
}

function upadd(obj,nums){
  var info = '<label style="float: left;margin-left: 4px;">|</label><div><input class="inp_1" style="width:80px;margin-left:3px;" placeholder="规格名称" name="gg_name['+nums+'][]" value="" /><input class="inp_1" style="width:60px;" placeholder="价格" name="gg_price['+nums+'][]" value="<?php echo $pro_info["price_yh"]; ?>" /><input class="inp_1" style="width:60px;" placeholder="库存" name="gg_stock['+nums+'][]" value="<?php echo $pro_info["num"]; ?>" /></div>';
  $(obj).siblings('#divs').append(info);
}

function jian(obj){
  $(obj).siblings('#divs').children('div:last-child').remove();
}

function del_info(obj){
  $('#divs').children('div:last-child').remove();
  var len = $('#divs').children().length;
  if (len<=0) {
    $('#button2').css('display','none');
  };
}

function ac_from(){
  //判断栏目名称
  /*var attr_name=document.getElementById('attr_name').value;
  if(attr_name.length<1){
	  alert('请输入属性名称.');
	  return false;
	  }*/

  return true;
}
</script>
</body>
</html>