<?php
return [
    'alipay'=>[
        'app_id'=>'2016101300677022',
        'ali_public_key'=>'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsBClRRPXZzTjWybbZYPBRZ1cnB5x9NT40KVumpvZenHAAq5SEoDkDndmjhJyAqfR2an4874AcdAUJLT7tx0Gqu/5EniOO/izjdNvBy3zkpqM3GKLjE7iEWYPvzAnrW0RC6Pi/PXXOTqh2y3sXmKvFzShOs5v4LyLzZOGsMTFznSg7F7AgFxuiKViANUlyPCGA++LMcvlRaGzhCW5SYq65+mds6dEpwjiEW7RTB5aYF2v3C9BOMrtOWMMDnsaRB4Jls5Rh/69Odt5hel2bgK6xwDp5i37WVqa41FSm672EGq8CU+hv9Ux4UeIyj4AApazz/GTjFVl4WYiV35a6e+TFwIDAQAB',
        'private_key'=>'MIIEpAIBAAKCAQEAlJlH+OUvDBoJcSxA5CHMNxCVPplt53xTgxMOYI7IV93aAQdU/UWS87BJBd40EDW1eusPu0KwcgzbZoZNNWDCnY2rsOCJn1MMOKYAXUZebbfEQtM20DHXSO/8Xm7Qj/jI1R4ip5y6U29zm1IIpysLltQ6C4reoU2Lb7APUBf2EzVyDlRNOeF9hkxS3PdzqXRH7TfJxt3z4+uXQzxnssrTqTyA/bFTtEe1D+0yL+CYl2IUlLs5Z7Gu2SXdmIRsRExBs09zipLBG9SxafmEqRVVJMDA+kMewP52TBVtk7TVwm9c9/Uy9juJprF4f8GtH7y6ykBDebyqVZynsm9I8GBhqQIDAQABAoIBAGVvPHHp//OC0m8uhh0z9PKhnz7b/OnHNDqFB4th6+AO0IFjP+CjXWx7KV2YEHIAN6FwU4zAOTGhFSMnCg0lv7NMwaY7n7XiOrVwm08QeeTrTE1RYFk9rHddWigb/MJKUM0phP5lPcs2iPO9S6rQ91g+BmFaqh3xkPzscYd6077H8GRjBBC5/5YUuPUsXe+C4aL2qGTzqlEh7NZLmMhM9Zg7bUpASwzgK6kKvEli3GYOx5nMSa66KoI5Twvt/khy4fOFmveAYaZnPui/4DerISW0WZTyQ9XBuYvVqs+B89gVOJUQB0hoISJVjJtmt6r7WVyPiZjtsR4sA+Wd4xTIFwECgYEA3X0/6XGCigeE69Y7biK/0d5HC3yEbIaejHJrni5I5/6zjT00a6bXlGOjM0thkjacK40i3IHVlo9tHAeFAflUiDhc3/DVKU4KYnJW8gDB+jSXKQJgwVPM7i6qIMhcoJtYTgKlfCSMsOkkL/shRCFG5ZVazDARApcKCiX5CSh8KhcCgYEAq8CUV2aYuSvknYoACEvrTHT7TJlL4/692uIScMY22ps9HAFq1sOTsgQ9sjvZRPQepQsky4e29eHfHLrEBrsfCRmrE8zbewPxSEiUmsNcvELPIxXZETQHU6pVYRdEC55ufmswybk9cQkM1N+GqhU9xg3XVKFASkk1wyuU9pwP6j8CgYEA20hJomFTEDzpiGQNarjUmH8sb17T7G5LQll12qGQZL9yHH9gCsSf4rXSudIDw7J1Y1jUDuQsBmfxajK3qIClBEhpCv1wzPgKp/Tzx5ygb4rprRxBlqXU2msw3EwCCLBD+Nf95q547B2mSiqjgMRBYMNBpa5g6OOIeQunRz3hz/kCgYA240SE6fTEuJJHBmMcQ6beuEPXJuZp5m8mFDlwcOf21MWivZE3MSlyKojM/PNiZeGlPPp1UNnXmmeC9uzOed5hOiLCISXDGm9xekCDdQud3nvz6neEV+w/gJ/od1b3n5oQLJFa5igMh6fiH80ZbdBgCuxVz3KMSvkzdioU5arwYQKBgQC20y/uxcFHyn+oXPtZB3mVzsbfCfYujNgcduo3abCnmUEo+Hf307dE/2jGI0GlcZmVf/BoPhrbYPTUhnZzEgMwjXKttb0qt8m+zlDL5WXas1kpeFu6cjFDLylel6J3KQjfCRzrriBhMLdLvvDTm4Zyujr2jVaJTowJl2hR9Ho76g==',
        'log'=>['file'=>storage_path('logs/alipay.log')],
        'return_url'=>'',
        'notify_url'=>''
    ],
    'wechat'=>[
        'app_id'=>'',
        'mch_id'=>'',
        'key'=>'',
        'cert_client' => resource_path('wechat_pay/applaction_cert.pem'),
        'cert_key'    => resource_path('wechat_pay/application_key.pem'),
        'log'=>['file'=>storage_path('logs/wechat_pay.log')],
        'notify_url'=>'',
        'refund_url'=>''
    ],
];