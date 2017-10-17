<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/minidingcanapi/Public/ht/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/action.js"></script>
</head>
<body>

<div class="aaa_pts_show_1">【 广告管理 】</div>

<div class="aaa_pts_show_2">
    
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('index');?>">全部广告</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('add');?>">添加广告</a></div>
    </div>
    <div class="aaa_pts_3">
      
      <div class="pro_4 bord_1">
         <div class="pro_5">标题：<input type="text" class="inp_1 inp_6" id="name" value="<?php echo $name;?>"></div>
         <div class="pro_6"><input type="button" class="aaa_pts_web_3" value="搜 索" style="margin:0;" onclick="product_option(0);"></div>
      </div>
      
      <table class="pro_3">
         <tr class="tr_1">
           <td style="width:80px;">ID</td>
           <td style="width:150px;">广告图</td>
           <td style="">广告标题</td>
           <td style="width:180px;">显示位置</td>
           <td style="width:100px;">排序</td>
           <td style="width:250px;">操作</td>
         </tr>
         <tbody id="news_option">
          <?php if(is_array($adv_list)): $i = 0; $__LIST__ = $adv_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$adv): $mod = ($i % 2 );++$i;?><tr>
		      <td><?php echo ($adv["id"]); ?></td>
          <td><img src="/minidingcanapi/Data/<?php echo ($adv["photo"]); ?>" width="120px" height="60px"></td>
          <td><?php echo ($adv["name"]); ?></td>
          <td>
              <?php if($adv["position"] == 1): ?><span class="label succ">首页头部轮播</span>
              <?php elseif($adv["position"] == 2): ?><span class="label blue">座位预订页</span>
              <?php else: ?>
              <span class="label err">其他</span><?php endif; ?>
          </td>
          <td><?php echo ($adv["sort"]); ?></td>
          <td class="obj_1">
		        <a href="<?php echo U('add');?>?adv_id=<?php echo ($adv["id"]); ?>" >修改</a>&nbsp;| 
			      <a onclick="del_id_url2(<?php echo ($adv["id"]); ?>)">删除</a>
		      </td>
	    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
         </tbody>
         <tr>
            <td colspan="10" class="td_2">
              <?php echo ($page); ?>
            </td>
         </tr>
      </table>      
    </div>
    
</div>
<script>
var type='<?php echo $type; ?>';

function product_option(page){
  var adv_name = $('#name').val();
  location="<?php echo U('index');?>?adv_name="+adv_name; 
}

function set_show(id){
  location="<?php echo U('show');?>?adv_id="+id;
}

function del_id_url2(id){
   if(confirm("确认删除吗？"))
   {
	  location='<?php echo U("del");?>?did='+id;   
   }
}

</script>
</body>
</html>