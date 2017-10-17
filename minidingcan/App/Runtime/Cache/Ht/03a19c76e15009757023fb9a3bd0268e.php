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
<div class="aaa_pts_show_1">【 首页图标管理 】</div>
<div class="aaa_pts_show_2">
    
    <div class="aaa_pts_3">     
      <table class="pro_3">
         <tr class="tr_1">
            <td>图标</td>
            <td>名称</td>
            <td>排序</td>
            <td>类型</td>
            <td style="width:180px;">操作</td>
         </tr>
         <tbody id="news_option">
           <!-- 遍历 -->
           <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><tr data-id="<?php echo ($v["id"]); ?>" data-name="<?php echo ($v["name"]); ?>">
               <td><img src="/minidingcanapi/Data/<?php echo ($v["photo"]); ?>" width="95px" height="50px"></td>
               <td><?php echo ($v["name"]); ?></td>
               <td><?php echo ($v["sort"]); ?></td>
               <td><?php if($v["link"] == 'list'): ?>产品分类<?php else: ?>系统图标<?php endif; ?></td>
               <td class="obj_1">
                  <a href="<?php echo U('More/addimg');?>?id=<?php echo ($v["id"]); ?>">修改</a>
               </td>
             </tr><?php endforeach; endif; else: echo "" ;endif; ?>
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
//搜索的方法
function product_option(page){
  window.location.href='?page='+page+'&message='+$("#message").val()
}
// function del_id_url(id){
//   alert(<?php echo U("More/fankui");?>);return false
//   //var yes=confirm('确定删除？')

//   if(yes){$.ajax({
//     type:'post',
//     url:'{:U("More/fankui")}',
//     data:{'id':id},
//     success:function(msg){
//       if(msg==1){
//         location.reload()
//       }
//     }
//    }) 
//   }
// }
</script>
</body>
</html>