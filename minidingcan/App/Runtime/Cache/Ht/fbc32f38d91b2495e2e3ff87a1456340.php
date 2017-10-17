<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/minidingcanapi/Public/ht/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/action.js"></script>
</head>
<body>

<div class="aaa_pts_show_1">【 座位预订设置 】</div>

<div class="aaa_pts_show_2">
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('set_seat');?>">全部座位</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('add_seat');?>">添加座位</a></div>
    </div>
    <div class="aaa_pts_3">
      
      <!-- <div class="pro_4 bord_1">
         <div class="pro_5">名  称：<input type="text" class="inp_1 inp_6" id="name" value="<?php echo ($name); ?>"></div> 
         <div class="pro_6"><input type="button" class="aaa_pts_web_3" value="搜 索" style="margin:0;" onclick="product_option(0);"></div>
      </div> -->
      
      <table class="pro_3">
         <tr class="tr_1">
           <td style="width:80px;">ID</td>
           <!-- <td style="width:130px;">所属店铺</td> -->
           <td>日期</td>
           <td>时间段</td>
           <td style="width:90px;">餐桌号</td>
           <td style="width:120px;">餐桌类型</td>
           <td style="width:90px;">可坐人数</td>
           <td style="width:100px;">预订费用</td>
           <td style="width:150px;">操作</td>
         </tr>
         <tbody id="news_option">
         <!-- 遍历 -->
          <?php if(is_array($boot_list)): $i = 0; $__LIST__ = $boot_list;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr>
             <td><?php echo ($v["id"]); ?></td>
             <td><?php echo ($v["thestarttime"]); ?> ~ <?php echo ($v["theendtime"]); ?></td>
             <td><?php echo ($v["timeslot"]); ?></td>
             <td><?php echo ($v["tablenum"]); ?></td>
             <td><?php echo ($v["tabletype"]); ?></td>
             <td><?php echo ($v["people"]); ?></td>
             <td><?php echo ($v["price"]); ?></td>
            <td>
              <!-- <a href="<?php echo U('add_seat');?>?id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>&name=<?php echo ($name); ?>&shop_id=<?php echo ($shop_id); ?>&tuijian=<?php echo ($tuijian); ?>">修改</a> | -->
              <a onclick="del_id_urls(<?php echo ($v["id"]); ?>)">删除</a>
             </td>
           </tr><?php endforeach; endif; else: echo "暂时没有数据" ;endif; ?>
         <!-- 遍历 -->
         </tbody>
         <tr>
            <td colspan="10" class="td_2">
                  <?php echo ($page_index); ?>  
             </td>
         </tr>
      </table>      
    </div>
    
</div>
<script>
function product_option(page){
	
	var pid = $('#pid').val();
	if(pid == ''){
		pid = $('#ppid').val();
	}
  var obj={
	   "name":$("#name").val(),
	   "shop_id":pid,
	   "tuijian":$("#tuijian").val()
	  }
	  //alert(obj);exit();
  var url='?page='+page;
  $.each(obj,function(a,b){
	  url+='&'+a+'='+b;
	 });
  location=url;
}

function del_id_urls (pro_id) {
  if (confirm('您确定要删除吗？')) {
    location.href="<?php echo U('del_seat');?>?did="+pro_id;
  };
}
</script>
</body>
</html>