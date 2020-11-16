<?php
return [
    'borrowType'=>[
        1=>'信用标',
        2=>'担保标',
        3=>'抵押标',
    ],
    'borrowArea'=>[
        1=>'项目专区',
        2=>'新手专区',
        3=>'活动专区',
    ],
    'repaymentType'=>[
        2=>'按月等额本息还款',
        3=>'按季等额本息还款',
        4=>'按月还息到期还本',
        5=>'一次性还款',
        6=>'按季还息到期还本',
    ],
    'borrowDuration' => [ //借款期限 正数单位为月 负数单位为天
        -7 => '7天',//当借款期限为7天时，只能选择还款方式5，以下同理
        -15 =>'15天',
        1 => '1月',
        2 => '2月',
        3 => '3月',
        4 => '4月',
        5 => '5月',
        6 => '6月',
        7 => '7月',
        8 => '8月',
        9 => '9月',
        10 => '10月',
        11 => '11月',
        12 => '12月',
    ],
    'use'=>array( //借款用途
        1 => '资金周转',
        2 => '票据质押借款',
        3 => '原材料借款',
        4 => '购买设备借款',
        5 => '租赁及劳务借款',
        6 => '保证金借款',
        7 => '其它借款',
    ),
    'invest_error' =>[//投标错误提示
        1 => '融资信息不存在',
        2 => '融资信息未发布，不允许投标',
        3 => '已超募集时间，不允许投标',
        4 => '投资金额为1000的倍数',
        5 => '投资超额还剩余',
        6 => '账号余额不足',
    ],
    'auto_error' =>[//自动投标没有投上的原因
        1 => '到期时间已到',
        2 => '借款利率小于用户设置的自动投标最低利率',
        3 => '不投天标',
        4 => '借款期限不符',
        5 => '没有开通自动投标权限',
        6 => '可用金额小于等于自动投标保留金额',
        7 => '可投金额小于自动投标最小投标金额',
        8 => '不是VIP会员',
        9 => '套接字连接失败',
        10 => '不能投自己的标',
        11 => '可投金额小于借款标最小投标金额',
        12 => '可投金额小于等于0',
        13 => '添加投资记录失败',
        14 => '一麻袋返回错误码',
        15 => '标已满被退款',
        16 => '不能投新手标',
        17 => '其他原因',
    ],
    'miss_overdue'=>0,//宽限期
    'rate_overdue'=>0.5,//每天千分之0.5的罚息费 还款人给投资人 比率*天数*本金
    'miss_manage'=>0,//管理费宽限期
    'rate_manage'=>0.15,//每天千分之0.15的管理费 还款人给平台 比率*天数*本金
];