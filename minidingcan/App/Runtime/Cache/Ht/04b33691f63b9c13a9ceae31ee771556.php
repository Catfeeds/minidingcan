<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="/minidingcanapi/Public/ht/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jquery.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/action.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/plugins/xheditor/xheditor-1.2.1.min.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/plugins/xheditor/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/jCalendar.js"></script>
<style>
<?php  $width=round($img['width']*0.6+6); $height =round( $width*$img['height'] / $img['width']); ?>
.dx1{float:left; margin-left: 17px; margin-bottom:10px; }
.dx2{color:#090; font-size:16px;  border-bottom:1px solid #CCC; width:100% !important; padding-bottom:8px;}
.dx3{width:120px; margin:5px auto; border-radius: 2px; border: 1px solid #b9c9d6; display:block;}
.dx4{border-bottom:1px solid #eee; padding-top:5px; width:100%;}
.img-err {
    position: relative;
    top: 2px;
    left: 82%;
    color: white;
    font-size: 20px;
    border-radius: 16px;
    background: #c00;
    height: 21px;
    width: 21px;
    text-align: center;
    line-height: 20px;
    cursor:pointer;
}
.btn{
            height: 25px;
            width: 60px;
            line-height: 24px;
            padding: 0 8px;
            background: #24a49f;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            color: #fff;
            display: inline-block;
            text-decoration: none;
            font-size: 13px;
            outline: none;
            -webkit-box-shadow: #666 0px 0px 6px;
            -moz-box-shadow: #666 0px 0px 6px;
        }
        .btn:hover{
          border: 1px #0080FF solid;
          background:#D2E9FF;
          color: red;
          -webkit-box-shadow: rgba(81, 203, 238, 1) 0px 0px 6px;
          -moz-box-shadow: rgba(81, 203, 238, 1) 0px 0px 6px;
        }
        .cls{
            background: #24a49f;
        }
</style>

</head>
<body>

<div class="aaa_pts_show_1">【 菜单管理 】</div>

<div class="aaa_pts_show_2">
    <div>
       <div class="aaa_pts_4"><a href="<?php echo U('Product/index');?>">全部菜单</a></div>
       <div class="aaa_pts_4"><a href="<?php echo U('Product/add');?>">添加菜单</a></div>
    </div>
    <div class="aaa_pts_3">
		<form action="?id=<?php echo ($id); ?>&page=<?php echo ($page); ?>&type=<?php echo ($type); ?>&name=<?php echo ($name); ?>&shop_id=<?php echo ($shop_id); ?>" method="post" onsubmit="return ac_from();" enctype="multipart/form-data">
		<ul class="aaa_pts_5">
			<li>
				<div class="d1">名  称:</div>
				<div>
					<input class="inp_1" name="name" id="name" value="<?php echo ($pro_allinfo["name"]); ?>"/>
				</div>
			</li>
      <li>
        <div class="d1">广告语:</div>
        <div>
          <input class="inp_1" name="intro" style="width:350px" id="intro" value="<?php echo ($pro_allinfo["intro"]); ?>"/>
        </div>
      </li>

      <!-- <li>
        <div class="d1">所属商家:</div>
        <div>
          <input class="inp_1" id="partner" value="<?php echo ($shangchang["name"]); ?>" disabled="disabled"/>
          <input type="hidden" name="shop_id" id="shop_id" value="<?php echo ($pro_allinfo["shop_id"]); ?>"/>
          <input type="button" value="选择商家" class="aaa_pts_web_3" style="margin-left:15px;" onclick="win_open('<?php echo U('Shangchang/index');?>?type=xz',1280,800)">
        </div>
       </li> -->

         <!-- 产品分类 -->
         <li class="product"><div class="d1 dx2">所属分类</div></li>
         <li>
            <div class="d1">选择分类:</div>
            <div>
              <select class="inp_1" name="cid" id="cid" onchange="getcid();" style="width:150px;margin-right:5px;">
                <!-- 遍历 -->
                <?php if(is_array($cate_list)): $i = 0; $__LIST__ = $cate_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><option value="<?php echo ($v["id"]); ?>" <?php if($v["id"] == $pro_allinfo['cid']): ?>selected="selected"<?php endif; ?>>-- <?php echo ($v["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                <!-- 遍历 -->
              </select>
              <span id="catedesc" style="color:red;font-size: 12px;">&nbsp;&nbsp; * 必选项</span>
            </div>
         </li>
         <!-- 产品分类 -->

		<!-- 产品单位 -->
        <!-- <li class="product"><div class="d1 dx2">产品单位</div></li>
		    <li class="product">
          <div class="d1">单 位:</div>
          <div>
            <input class="inp_1 inp_6" name="company" id="company" value="<?php echo ($pro_allinfo["company"]); ?>"/><span style="color:red;font-size: 12px;">&nbsp;&nbsp;举例:个/只/件&nbsp;&nbsp;请根据产品来自行添加相应单位</span>
            </div>
        </li> -->
        <!-- 产品单位 -->
		 
         <li class="product"><div class="d1 dx2">价格管理</div></li>
         <!-- <li class="product">
            <div class="d1">原 价:</div>
            <div>
              <input class="inp_1 inp_6" name="price" id="price" value="<?php echo ($pro_allinfo["price"]); ?>"/>
            </div>
         </li> -->
         <li class="product">
            <div class="d1">价格:</div>
            <div>
              <input class="inp_1 inp_6" name="price_yh" id="price_yh" value="<?php echo ($pro_allinfo["price_yh"]); ?>"/>
            </div>
         </li>
         <!-- <li class="product">
            <div class="d1">赠送积分:</div>
            <div>
              <input class="inp_1 inp_6" name="price_jf" id="price_jf" value="<?php echo ($pro_allinfo["price_jf"]); ?>"/>
              <span style="color:red;font-size: 12px;">&nbsp;&nbsp;说明: 赠送积分用于前端优惠券兑换</span>
            </div>
         </li> -->
         <li class="product"><div class="d1 dx2">其他信息</div></li>
         <li>
            <div class="d1">库存:</div>
            <div>
              <input class="inp_1 inp_6" name="num" id="num" value="<?php echo $pro_allinfo['num']==0 ? 9999 : $pro_allinfo['num']; ?>"/>
              请填写0~9999之间的数字
            </div>
         </li>
		    <li>
          <div style="color:#c00; font-size:14px; padding-left:20px;">上传列表缩略图大小:  230*230的图片 &nbsp;&nbsp;&nbsp;只能添加一张图片！！</div>
        </li>
        <li>
          <div class="d1">缩略图:</div>
           <div>
            <?php if ($pro_allinfo['photo_x']) { ?>
                  <img src="/minidingcanapi/Data/<?php echo $pro_allinfo['photo_x']; ?>" width="80" height="80" style="margin-bottom: 3px;" />
                  <br />
              <?php } ?>
              <input type="file" name="photo_x" id="photo_x" />
            </div>
         </li>
        <li>
            <div style="color:#c00; font-size:14px; padding-left:20px;">上传大图:  600*600的图片&nbsp;&nbsp;&nbsp;<!-- 可多张 --></div>
        </li>
        <li>
          <div class="d1">大 图:</div>
           <div>
            <?php if ($pro_allinfo['photo_d']) { ?>
                  <img src="/minidingcanapi/Data/<?php echo $pro_allinfo['photo_d']; ?>" width="125" height="125" style="margin-bottom: 3px;" />
                <br />
              <?php } ?>
              <input type="file" name="photo_d" id="photo_d" />
           </div>
         </li>
         <li>
            <div style="color:#c00; font-size:14px; padding-left:20px;">上传详情轮播图: 600*600的图片，可添加多张&nbsp;&nbsp;&nbsp;<!-- 可多张 --></div>
         </li>
        <?php if (is_array($img_str)) { ?>
        <li>
          <div class="d1">已上传：</div>
          <?php foreach ($img_str as $v) { ?>
           <div>
            <div class="img-err" title="删除" onclick="del_img('<?php echo $v; ?>',this);">×</div>
             <?php if (intval($pro_allinfo['import_id'])!=0) { ?>
              <img src="<?php echo C('IMPORT_IMG_URL').$v; ?>" width="125" height="125">
             <?php }else{ ?>
              <img src="<?php echo '/minidingcanapi/Data/'.$v; ?>" width="125" height="125">
             <?php } ?>
           </div>
          <?php } ?>
         </li>
         <?php } ?>
         <li id="imgs_add">
          <div class="d1">轮播图:</div>
           <div>
              <input type="file" name="files[]" style="width:160px;" />
           </div>
          </li>
        <li>
          <div class="d1">&nbsp;</div>
          <div>
             &nbsp;<span class="btn cls" style="background:#D0D0D0; width:40px; color:black;" onclick="upadd();">添加+</span>
          </div>
        </li>
         <li>
            <div class="d1">简介:</div>
            <div>
              <textarea class="inp_1 inp_2" style="width:450px;height:150px;" name="content" id="content"/><?php echo ($pro_allinfo["content"]); ?></textarea>
            </div>
         </li>
         <!-- <li>
            <div class="d1">产品参数:</div>
            <div>
              <textarea class="inp_1 inp_2" name="param" id="param"/><?php echo ($pro_allinfo["param"]); ?></textarea>
            </div>
         </li>
         <li>
            <div style="color:#c00; font-size:14px; padding-left:20px;">注意：添加多产品参数请用英文小写 , 号隔开,例如   （型号:MS）此处的冒号为英文冒号</div>
         </li> -->
        <li>
            <div class="d1">排序:</div>
            <div>
              <input class="inp_1" style="width:150px;" name="sort" id="sort" value="<?php echo (int)$pro_allinfo['sort']; ?>"/>
            </div>
         </li>
         <li>
            <div class="d1">人气:</div>
            <div>
              <input class="inp_1" style="width:150px;" name="renqi" id="renqi" value="<?php echo (int)$pro_allinfo['renqi']; ?>"/>
            </div>
         </li>
         <li>
            <div class="d1">月销:</div>
            <div>
              <input class="inp_1" style="width:150px;" name="salenum" id="salenum" value="<?php echo (int)$pro_allinfo['salenum']; ?>"/>
            </div>
         </li> 
         <li>
            <div class="d1">是否外卖:</div>
            <div>
               <input type="radio" name="is_wm" value="1" <?php echo $pro_allinfo['is_wm']==1 ? 'checked="checked"' : null?>/> 是  &nbsp;
               <input type="radio" name="is_wm" value="0" <?php echo $pro_allinfo['is_wm']!=1 ? 'checked="checked"' : null?> /> 否
            </div>
         </li> 
      <li><input type="submit" name="submit" value="提交" class="aaa_pts_web_3" border="0" id="aaa_pts_web_s">
          <input type="hidden" name="pro_id" id='pro_id' value="<?php echo ($pro_allinfo["id"]); ?>">
      </li>
      </ul>
      </form>
         
    </div>
    
</div>
<script type="text/javascript" src="/minidingcanapi/Public/ht/js/product.js"></script>
<script>
function upadd(obj){
  //alert('aaa');
  $('#imgs_add').append('<div>&nbsp;&nbsp;<input type="file" style="width:160px;" name="files[]" /><a onclick="$(this).parent().remove();" class="btn cls" style="background:#D0D0D0; width:40px; color:black;"">&nbsp;&nbsp;&nbsp;删除</a></div>');
  return false;
}

// function getcid(){
//   var cateid = $('#cateid').val();
//   $.post('<?php echo U("getcid");?>',{cateid:cateid},function(data){
//       if(data.catelist!=''){
//         var htmls = '<option value="">二级分类</option>';
//         var cate = data.catelist;
//         for (var i = 0; i<cate.length; i++) {
//           htmls += '<option value="'+cate[i].id+'">-- '+cate[i].name+'</option>';
//         }
//         $('#cid').html(htmls);
//         $('#catedesc').html('&nbsp;&nbsp; * 必选项');
//       }else{
//         $('#cid').html('<option value="">二级分类</option>');
//         $('#catedesc').html('&nbsp;&nbsp; * 该分类下还没有二级分类，请先添加');
//       }
//     },"json");
// }

//图片删除
function del_img(img,obj){
  var pro_id = $('#pro_id').val();
  if (confirm('是否确认删除？')) {
    $.post('<?php echo U("img_del");?>',{img_url:img,pro_id:pro_id},function(data){
      if(data.status==1){
        $(obj).parent().remove();
        return false;
      }else{
        alert(data.err);
        return false;
      }
    },"json");
  };
}

function ac_from(){

  var name=document.getElementById('name').value;
  if(name.length<1){
	  alert('名称不能为空');
	  return false;
	} 
  
  var cid=parseInt(document.getElementById("cid").value);
  if(!cid){
    alert("请选择分类.");
    return false;
  }

 //  var pid=parseInt(document.getElementById("shop_id").value);
	// if(isNaN(pid) || pid<1){
	// 	alert("请选择所属商家");
	// 	return false;
	// }
  
}

//初始化编辑器
// $('#content').xheditor({
//   skin:'nostyle' ,
//   upImgUrl:'<?php echo U("Upload/xheditor");?>'
// });
</script>
</body>
</html>