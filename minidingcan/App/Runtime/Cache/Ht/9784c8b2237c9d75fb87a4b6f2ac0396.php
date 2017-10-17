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

<div class="aaa_pts_show_1">【 菜单管理 】</div>

<div class="aaa_pts_show_2">
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('Product/index');?>">全部菜单</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('Product/add');?>">添加菜单</a></div>
    </div>
    <div class="aaa_pts_3">
      
      <div class="pro_4 bord_1">
         <div class="pro_5">名  称：<input type="text" class="inp_1 inp_6" id="name" value="<?php echo ($name); ?>"></div>
         <div class="pro_5">
               推荐产品：
               <select class="inp_1 inp_6" id="tuijian">
			      <option value="">全部产品</option>
                  <option value="1" <?php echo $tuijian=='1' ? 'selected="selected"' : NULL ?>>推荐产品</option>
                  <option value="0" <?php echo $tuijian=='0' ? 'selected="selected"' : NULL ?>>非推荐产品</option>
	           </select>
         </div>  
         <div class="pro_6"><input type="button" class="aaa_pts_web_3" value="搜 索" style="margin:0;" onclick="product_option(0);"></div>
      </div>
      
      <table class="pro_3">
         <tr class="tr_1">
           <td style="width:80px;">ID</td>
           <td style="width:90px;">图片</td>
           <!-- <td style="width:130px;">所属店铺</td> -->
           <td>[分类]名称</td>
           <td style="width:100px;">价格/元</td>
           <td style="width:80px;">人气</td>
           <td style="width:90px;">是否外卖</td>
           <td style="width:100px;">推荐</td>
           <td style="width:300px;">操作</td>
         </tr>
         <tbody id="news_option">
         <!-- 遍历 -->
          <?php if(is_array($productlist)): $i = 0; $__LIST__ = $productlist;if( count($__LIST__)==0 ) : echo "暂时没有数据" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr>
             <td><?php echo ($v["id"]); ?></td>
             <td style="padding:3px 0;"><img src="/minidingcanapi/Data/<?php echo ($v["photo_x"]); ?>" width="80px" height="80px"/></td>
             <!-- <td><?php echo ($v["shangchang"]); ?></td> -->
             <td><label style="color:red;">【<?php echo ($v["cname"]); ?>】</label><?php echo ($v["name"]); ?></td>
             <td><?php echo ($v["price_yh"]); ?></td>
             <td><?php echo ($v["renqi"]); ?></td>
             <td><a href="<?php echo U('set_wm');?>?pro_id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>&name=<?php echo ($name); ?>"><?php if($v["is_wm"] == 1): ?><label style="color:green;">是</label><?php else: ?><label style="color:gray;">否</label><?php endif; ?></a></td>
             <td><?php if($v["type"] == 1): ?><label style="color:green;">推荐</label><?php endif; ?></td>
            <td>
              <!-- <?php if($v["pro_buff"] != ''): ?><a href="<?php echo U('Product/pro_guige');?>?pid=<?php echo ($v["id"]); ?>">
              <?php else: ?>
              <a href="<?php echo U('Product/set_attr');?>?pid=<?php echo ($v["id"]); ?>"><?php endif; ?><font style="color:red;">属性设置</font></a> | -->
              <a href="<?php echo U('set_tj');?>?pro_id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>&name=<?php echo ($name); ?>&shop_id=<?php echo ($shop_id); ?>&tuijian=<?php echo ($tuijian); ?>">推荐</a> |
              <!-- <a onclick="win_open('<?php echo U('Product/pinglun');?>?id=<?php echo ($v["id"]); ?>',1500,1200)">查看评论</a> | -->
              <a href="<?php echo U('Product/add');?>?id=<?php echo ($v["id"]); ?>&page=<?php echo ($page); ?>&name=<?php echo ($name); ?>&shop_id=<?php echo ($shop_id); ?>&tuijian=<?php echo ($tuijian); ?>">修改</a> |
              <!-- <a href="<?php echo U('Product/access');?>?id=<?php echo ($v["id"]); ?>">统计</a> | -->
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
    location.href="<?php echo U('del');?>?did="+pro_id;
  };
}
</script>
</body>
</html>