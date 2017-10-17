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

<div class="aaa_pts_show_1">【 综合管理 】</div>

<div class="aaa_pts_show_2">
    
    <div class="aaa_pts_3">
      <table class="pro_3">
         <tr class="tr_1">
           <td style="width:40px;">id</td>
           <td>标题</td>
           <td style="width:180px;">操作</td>
         </tr>
         <tbody id="news_option">
         <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr>
             <td><?php echo ($v["id"]); ?></td>
             <td><?php echo ($v["uname"]); ?></td>
             <td class="obj_1">
              <a href="<?php echo U('More/pweb');?>?id=<?php echo ($v["id"]); ?>">修改</a>
             </td>
          </tr><?php endforeach; endif; else: echo "" ;endif; ?>
         </tbody>
         <tr>
            <td colspan="10" class="td_2">
               
            </td>
         </tr>
      </table>      
    </div>
    
</div>
</body>
</html>