<?php
namespace Api\Controller;
use Think\Controller;
class VoucherController extends PublicController {
	//***************************
	//  所有单页数据接口
	//***************************
    public function index(){
    	$condition = array();
        $condition['del'] = 0;
        $condition['start_time'] = array('lt',time());
        $condition['end_time'] = array('gt',time());

        $vou = M('voucher')->where($condition)->order('addtime desc')->select();
        foreach ($vou as $k => $v) {
            $vou[$k]['start_time'] = date("Y-m-d",intval($v['start_time']));
            $vou[$k]['end_time'] = date("Y-m-d",intval($v['end_time']));
            $vou[$k]['amount'] = floatval($v['amount']);
            $vou[$k]['full_money'] = floatval($v['full_money']);
            if ($v['proid']=='all' || empty($v['proid'])) {
                $vou[$k]['desc'] = '店内通用';
            }else{
                $vou[$k]['desc'] = '限定商品';
            }
        }

        $authtype = M('user')->where('id='.intval($_REQUEST['uid']).' AND del=0')->getField('authtype');

        echo json_encode(array('status'=>1,'vou'=>$vou,'authtype'=>intval($authtype)));
        exit();
    }

    //***************************
    //  用户领取优惠券
    //***************************
    public function get_voucher(){
        $vid = intval($_REQUEST['vid']);
        $uid = intval($_REQUEST['uid']);
        $check_user = M('user')->where('id='.intval($uid).' AND del=0')->find();
        if (!$check_user) {
            echo json_encode(array('status'=>0,'err'=>'登录状态异常！err_code:'.__LINE__));
            exit();
        }

        $check_vou = M('voucher')->where('id='.intval($vid).' AND del=0')->find();
        if (!$check_vou) {
            echo json_encode(array('status'=>0,'err'=>'优惠券信息错误！err_code:'.__LINE__));
            exit();
        }

        //判断是否已领取过
        $check = M('user_voucher')->where('uid='.intval($uid).' AND vid='.intval($vid))->getField('id');
        if ($check) {
            echo json_encode(array('status'=>0,'err'=>'您已经领取过了！'));
            exit();
        }

        if (intval($check_vou['point'])!=0 && intval($check_vou['point'])>intval($check_user['jifen'])) {
            echo json_encode(array('status'=>0,'err'=>'积分余额不足！'));
            exit();
        }

        if ($check_vou['start_time']>time()) {
            echo json_encode(array('status'=>0,'err'=>'优惠券还未生效！'));
            exit();
        }

        if ($check_vou['end_time']<time()) {
            echo json_encode(array('status'=>0,'err'=>'优惠券已失效！'));
            exit();
        }

        if (intval($check_vou['count'])<=intval($check_vou['receive_num'])) {
            echo json_encode(array('status'=>0,'err'=>'优惠券已被领取完了！'));
            exit();
        }

        $data = array();
        $data['uid'] = $uid;
        $data['vid'] = $vid;
        $data['shop_id'] = intval($check_vou['shop_id']);
        $data['full_money'] = floatval($check_vou['full_money']);
        $data['amount'] = floatval($check_vou['amount']);
        $data['start_time'] = $check_vou['start_time'];
        $data['end_time'] = $check_vou['end_time'];
        $data['addtime'] = time();
        $res = M('user_voucher')->add($data);
        if ($res) {
            //修改会员积分
            if (intval($check_vou['point'])!=0) {
                $arr = array();
                $arr['jifen'] = intval($check_user['jifen'])-intval($check_vou['point']);
                $up = M('user')->where('id='.intval($uid))->save($arr);
            }

            //修改领取数量
            $arrs = array();
            $arrs['receive_num'] = intval($check_vou['receive_num'])+1;
            $ups = M('voucher')->where('id='.intval($vid))->save($arrs);
            
            echo json_encode(array('status'=>1));
            exit();
        }else{
            echo json_encode(array('status'=>0,'err'=>'领取失败！'));
            exit();
        }
    }

    //*******************************
    //  用户验证手机 领取优惠券
    //*******************************
    public function get_vou(){
        $vid = intval($_REQUEST['vid']);
        $uid = intval($_REQUEST['uid']);
        $tel = trim($_REQUEST['tel']);
        if (!$tel || !$vid) {
            echo json_encode(array('status'=>0,'err'=>'参数错误！err_code:'.__LINE__));
            exit();
        }

        $check_user = M('user')->where('id='.intval($uid).' AND del=0')->find();
        if (!$check_user) {
            echo json_encode(array('status'=>0,'err'=>'登录状态异常！err_code:'.__LINE__));
            exit();
        }

        $checktel = M("user")->where('tel="'.trim($tel).'" AND del=0 AND authtype=1')->getField('id');
        if ($checktel) {
            echo json_encode(array('status'=>0,'err'=>'手机号已被认证了！err_code:'.__LINE__));
            exit();
        }

        //验证手机号码
        if (intval($check_user['authtype'])==0) {
            $up = array();
            $up['authtype'] = 1;
            $up['tel'] = $tel;
            $result = M('user')->where('id='.intval($uid))->save($up);
            if (!$result) {
                echo json_encode(array('status'=>0,'err'=>'领取失败！err_code:'.__LINE__));
                exit();
            }
        }

        $check_vou = M('voucher')->where('id='.intval($vid).' AND del=0')->find();
        if (!$check_vou) {
            echo json_encode(array('status'=>0,'err'=>'优惠券信息错误！err_code:'.__LINE__));
            exit();
        }

        //判断是否已领取过
        $check = M('user_voucher')->where('uid='.intval($uid).' AND vid='.intval($vid))->getField('id');
        if ($check) {
            echo json_encode(array('status'=>0,'err'=>'您已经领取过了！'));
            exit();
        }

        if (intval($check_vou['point'])!=0 && intval($check_vou['point'])>intval($check_user['jifen'])) {
            echo json_encode(array('status'=>0,'err'=>'积分余额不足！'));
            exit();
        }

        if ($check_vou['start_time']>time()) {
            echo json_encode(array('status'=>0,'err'=>'优惠券还未生效！'));
            exit();
        }

        if ($check_vou['end_time']<time()) {
            echo json_encode(array('status'=>0,'err'=>'优惠券已失效！'));
            exit();
        }

        if (intval($check_vou['count'])<=intval($check_vou['receive_num'])) {
            echo json_encode(array('status'=>0,'err'=>'优惠券已被领取完了！'));
            exit();
        }

        $data = array();
        $data['uid'] = $uid;
        $data['vid'] = $vid;
        $data['shop_id'] = intval($check_vou['shop_id']);
        $data['full_money'] = floatval($check_vou['full_money']);
        $data['amount'] = floatval($check_vou['amount']);
        $data['start_time'] = $check_vou['start_time'];
        $data['end_time'] = $check_vou['end_time'];
        $data['addtime'] = time();
        $res = M('user_voucher')->add($data);
        if ($res) {
            //修改会员积分
            if (intval($check_vou['point'])!=0) {
                $arr = array();
                $arr['jifen'] = intval($check_user['jifen'])-intval($check_vou['point']);
                $up = M('user')->where('id='.intval($uid))->save($arr);
            }

            //修改领取数量
            $arrs = array();
            $arrs['receive_num'] = intval($check_vou['receive_num'])+1;
            $ups = M('voucher')->where('id='.intval($vid))->save($arrs);
            
            echo json_encode(array('status'=>1));
            exit();
        }else{
            echo json_encode(array('status'=>0,'err'=>'领取失败！'));
            exit();
        }
    }

    //***************************
    //  发送手机验证码
    //***************************
    public function get_code(){
        $tel = trim($_REQUEST['tel']);
        $uid = intval($_REQUEST['uid']);
        if (!$tel || !$uid) {
            echo json_encode(array('status'=>0,'err'=>'参数错误！'));
            exit();
        }

        if(!preg_match("/^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$/",$tel)){    
            echo json_encode(array('status'=>0,'err'=>'手机号码格式错误！err_code:'.__LINE__));
            exit(); 
        }

        $checktel = M("user")->where('tel="'.trim($tel).'" AND del=0 AND authtype=1')->getField('id');
        if ($checktel) {
            echo json_encode(array('status'=>0,'err'=>'手机号已被认证了！err_code:'.__LINE__));
            exit();
        }

        $alidayu = C('Alidayu');
        $appkey = $alidayu['appkey'];
        $secretKey = $alidayu['secretKey'];
        $setSmsFreeSignName = $alidayu['setSmsFreeSignName'];

        vendor("Sms.TopSdk");
        //短信API产品名
        $product = "Dysmsapi";
        //短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";
        //暂时不支持多Region
        $region = "cn-hangzhou";

        $codes = rand(100000,999999);
        
        //初始化访问的acsCleint
        $profile = \DefaultProfile::getProfile($region, $appkey, $secretKey);
        \DefaultProfile::addEndpoint("cn-hangzhou", "cn-hangzhou", $product, $domain);
        $acsClient= new \DefaultAcsClient($profile);
        
        $request = new \Dysmsapi\Request\V20170525\SendSmsRequest;
        //必填-短信接收号码
        $request->setPhoneNumbers($tel);
        //必填-短信签名
        $request->setSignName($setSmsFreeSignName);
        //必填-短信模板Code
        $request->setTemplateCode("SMS_77325005");
        //选填-假如模板中存在变量需要替换则为必填(JSON格式)
        $request->setTemplateParam("{\"codes\":\"".$codes."\",\"product\":\"".$setSmsFreeSignName."\"}");
        //选填-发送短信流水号
        $request->setOutId("1234");
        
        //发起访问请求
        $acsResponse = $acsClient->getAcsResponse($request);
        //dump($req);
        // dump($resp);
        if($acsResponse){
            $sms_log=M("sms_log");
            $array['tel']=$tel;
            $array['code']=$codes;
            $array['start_time']=time();
            $array['end_time']=$array['start_time']+900;//验证码15分钟有效;
            @$check=$sms_log->where("tel=$tel")->find();
            if($check){
                $sms_log->where("tel=$tel")->save($array);
            }else{
                $sms_log->add($array);
            }
            echo json_encode(array('status'=>1,'codes'=>$codes));
            exit();
        }else{
            echo json_encode(array('status'=>0,'err'=>'验证码发送失败！err_code:'.$acsResponse));
            exit();
        } 
    }
}