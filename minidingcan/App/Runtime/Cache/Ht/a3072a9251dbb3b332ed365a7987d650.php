<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理程序</title>
<link href="/minidingcanapi/Public/ht/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery1.8.js"></script>
<link href="/minidingcanapi/Public/ht/css/order.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="aaa_pts_show_1"><span class="aaa_pts_show_2">【 订单管理 】</span></div>
<div class="aaa_pts_show_2">
  <div>
       <div class="aaa_pts_4">订单管理查看</div>
    </div>
  
  <div class="aaa_pts_show_5">
   <div class="aaa_pts_3">

<?php  if ($order_info['back']>0) { if ($order_info['back']==2) { $zt='<span style="color:#999;">已退款</span>'; }else{ $zt='<span style="color:red;">退款中</span>'; } }else{ switch($order_info['status']){ case '10': $zt='<span style="color:#c00;">未付款</span>'; break; case '20': $zt='<span style="color:#F92;">已付款</span>'; break; case '50': $zt='<span style="color:#090;">交易完成</span>'; break; case '40': $zt='<span style="color:#999;">已收货</span>'; break; case '30': $zt='<span style="color:#F92;">已发货</span>'; break; } } ?>
	  <div class="ord_show_3">
         <div>订单号：<font><?php echo $order_info['order_sn']; ?></font></div>
		 <div>订单时间：<font><?php echo date("Y-m-d H:i:s",$order_info['addtime']) ?></font></div>
		 <div>付款状态：<?php echo $zt; ?></div>
      </div>

      
      
      <table class="pro_3">
         <tr class="tr_1">
           <td>产品名称</td>
           <td style="width:10%;">产品价格</td>
           <td style="width:5%;">数量</td>
           <td style="width:15%;">总价</td>
           <td style="width:15%;">产品属性</td>
         </tr>
         <?php if(is_array($order_pro)): $i = 0; $__LIST__ = $order_pro;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro): $mod = ($i % 2 );++$i;?><tr id="concent_tr_<?php echo ($pro["id"]); ?>">
             <td><?php echo ($pro["name"]); ?></td>
             <td>￥ <?php echo ($pro["price"]); ?></td>
             <td><?php echo ($pro["num"]); ?></td>
             <td><font style="color:#c00;">￥ <?php echo number_format($pro['price']*$pro['num'],2); ?></font></td>
             <td><?php echo ($pro["pro_buff"]); ?></td>
           </tr><?php endforeach; endif; else: echo "" ;endif; ?>
      </table>
      
     <div style="border-bottom:1px solid #b9c9d6;">
	 <ul style="margin-top:15px;  padding-bottom:5px; width:500px; float:left;">
         <li style="font-size:15px; color:#000;">收货地址信息：</li>
         <li style="padding-top:5px;">
             <div>收货人：<?php echo $order_info['receiver']; ?></div>
             <div>联系电话：<?php echo $order_info['tel']; ?></div>
             <div>邮政编码：<?php echo $order_info['code']; ?></div>
			 <div>收货地址：<?php echo $order_info['address_xq']; ?></div>
         </li>
      </ul>
	  <ul style="margin-top:15px; padding-bottom:5px; width:300px; float:left;">
         <li style="font-size:15px; color:#000;">买家留言：</li>
         <li style="padding:5px 0 0 0; padding-top:5px; color:#090; font-size:14px;">
             <?php echo $order_info['remark']; ?>
         </li>
		 <li style="font-size:15px; color:#000;">邮费信息：</li>
         <li style="padding:5px 0 0 0; color:#090; font-size:14px;">
             <?php if ($post_info) { echo $post_info['price']."（".$post_info['name']."）"."<br />".$order_info['post_remark']; }else { echo "卖家包邮"; } ?>
         </li>
	 </ul> 
	  <ul style="margin-top:15px; padding-bottom:5px; width:300px; float:left;">
		 <li style="font-size:15px; color:#000;">物流信息：</li>
		<li>
			暂无
		</li>
      </ul>
	  </div>
      <div class="ord_show_5">
         <div style="color:#c00; line-height:28px;">发送待收货短信通知，要求订单状态必须为“待收货”,表示卖家已经发货。</div>
         发货快递：<input id="kuaidi_name" value="<?php echo $order_info['kuaidi_name'];?>"/>
         &nbsp;&nbsp;
         运 单 号：<input id="kuaidi_num" value="<?php echo $order_info['kuaidi_num'];?>"/>
         &nbsp;&nbsp;&nbsp;
         <input type="button" value="提交" style="border-radius: 5px;width: 80px;border: solid 1px #999;height: 30px; cursor:pointer;" onclick="sms_message()"/>
         <input type="hidden" value="<?php echo $order_info['status']; ?>" name="o_status" id="o_status">
      </div>
      
      <div class="ord_show_1">
         <div class="ord_show_4">
            状态修改：
            <select id="zt_order_update">
            	<option value="">全部状态</option>
                 <?php foreach ($order_status as $key => $val) { ?>
			      	<option value="<?php echo $key; ?>" <?php if($order_info['status']==$key) { ?>selected="selected"<?php } ?> >- <?php echo $val; ?></option>
			      <?php } ?>
            </select>
         </div>
         <font>订单价格:</font> ￥ <?php echo number_format($order_info['price'],2); ?>
      </div>
      
	  <?php if($order_info['back']>0){ ?>
	  <div class="ord_show_1">
	  <div class="ord_show_6" style="float:left;margin-top:10px">
		退款原因：<span style="color:#c00;"><?php echo $order_info['back_remark'];?></span>
	  </div>
	  </div>
	  <?php } ?>
	  
      <!--<ul style="margin-top:15px; border-bottom:1px solid #b9c9d6; padding-bottom:5px; display:none;">
         <li style="font-size:15px; color:#000;">快递详情：</li>
         <li style="padding-top:5px;" id="kdxq">
			 <div style="padding-bottom:15px;">快递运单号：
				 <select>
					<option value="sf" id="kuaidi">顺丰快递</option>
				 </select>
				 <input type="text" id="kuaidi_num" style="width:200px;" value=""> 
				 <a href="javascript:;" onclick="kuaidi_update()">修改</a>
			 </div>
         </li>
      </ul>-->
      
   </div>
  </div>
</div>
<script>
//删除订单
/*function order_show_updata(id,type){
  if(id=='' || id==null)return;
   var $val='';
  if(type!='del'){
	   $val=document.getElementById('pro_beizhu_'+id).value;
  }
 
  $.post('include/order_beizhu.php',{"id":id,"beizhu":$val,"type":type},function(data){
	  if(data=='1'){
		  alert('操作成功！');
		  if(type=='del'){window.close(); window.opener.history.go(0);}
	  }else{
		  alert("操作失败");
	  }
  });
}*/

//保存快递名称，快递单号
function sms_message(){
	try{
		//if(!confirm('确定发送订单发货短信吗？')) return;
		//获取订单当前状态
		var o_status = $('#o_status').val();
		//获取订单选择状态
		var order_status = $('#zt_order_update').val();
		//选择状态不能比当前状态小，已付款的订单不能变成未付款
		//if (order_status && order_status!=40 && order_status<o_status) {return;};
		//获取快递名称
		var kuaidi_name = $('#kuaidi_name').val();
		if(kuaidi_name.length<1 && order_status==30) throw ('快递名称不能为空！');
		//获取快递单号
		var kuaidi_num = $('#kuaidi_num').val();
		if(kuaidi_num.length<1 && order_status==30) throw ('运单号不能为空！');

		if (!order_status && kuaidi_num.length<1 && kuaidi_name.length<1) {
			throw ('请输入快递信息或选择订单状态！');
		};
		
		$.ajax({
            type: "POST",
			url: "<?php echo U('sms_up');?>",
			data:{'order_status':order_status,'kuaidi_name':kuaidi_name,'kuaidi_num':kuaidi_num,'oid':<?php echo $order_info['id'];?>},
            dataType: "json",
            success: function (data) {
                if(data.returns){
				   alert('提交成功！');
				   window.reload();
				}else{
				   alert(data.message);
				}
				
            },
            error: function (msg) {
				alert ('网络连接失败！');
            }
        });
		
	}catch(e){
		alert(e);
	}
}
</script>
</body>
</html>