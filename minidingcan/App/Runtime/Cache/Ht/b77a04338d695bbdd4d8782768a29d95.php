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

<div class="aaa_pts_show_1">【 活动管理 】</div>

<div class="aaa_pts_show_2">
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('index');?>">全部活动</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('add');?>">添加活动</a></div>
    </div>
    <div class="aaa_pts_3">
      <form name='form' action="<?php echo U('index');?>" method='get'>
      <div class="pro_4 bord_1">
         <div class="pro_5">标题：<input type="text" class="inp_1 inp_6" name='news_name' id="name" value="<?php echo $name;?>"></div>
         <!-- <div class="pro_5">
               新闻类别：
               <select class="inp_1 inp_6" name="pid" id="pid">
			           <option value="">全部类别</option>
                 <?php if(is_array($cate_list)): $i = 0; $__LIST__ = $cate_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i; if($cate["id"] == $cid): ?><option value="<?php echo ($cate["id"]); ?>" selected="selected" >- <?php echo ($cate["name"]); ?></option>
                 <?php else: ?>
                 <option value="<?php echo ($cate["id"]); ?>" >- <?php echo ($cate["name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
               </select>
         </div> -->
         <div class="pro_6"><input type="button" class="aaa_pts_web_3" value="搜 索" style="margin:0;" onclick="product_option();"></div>
      </div>
      </form>
      <table class="pro_3">
         <tr class="tr_1">
           <td style="width:80px;">ID</td>
           <td>活动标题</td>
           <td>添加时间</td>
           <td style="width:180px;">操作</td>
         </tr>
          <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
            <td><?php echo ($vo["id"]); ?></td>
            <td><?php echo ($vo["name"]); ?></td>
            <td><?php echo ($vo["addtime"]); ?></td>
            <td><a href="<?php echo U('add');?>?news_id=<?php echo ($vo["id"]); ?>">修改</a> | 
              <!-- <a href="<?php echo U('review');?>?news_id=<?php echo ($vo["id"]); ?>">查看评论</a> |  -->
              <a onclick="del_id_url2(<?php echo ($vo["id"]); ?>)">删除</td>
          </tr><?php endforeach; endif; else: echo "" ;endif; ?>  
         <tr>
            <td colspan="10" class="td_2">
                <?php echo ($page); ?>
             </td>
         </tr>
      </table>      
    </div>
    
</div>
<script>
function product_option(){
      $('form').submit();
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