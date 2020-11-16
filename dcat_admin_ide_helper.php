<?php

/**
 * A helper file for Dcat Admin, to provide autocomplete information to your IDE
 *
 * This file should not be included in your code, only analyzed by your IDE!
 *
 * @author jqh <841324345@qq.com>
 */
namespace Dcat\Admin {
    use Illuminate\Support\Collection;

    /**
     * @property Grid\Column|Collection name
     * @property Grid\Column|Collection version
     * @property Grid\Column|Collection alias
     * @property Grid\Column|Collection authors
     * @property Grid\Column|Collection enable
     * @property Grid\Column|Collection imported
     * @property Grid\Column|Collection config
     * @property Grid\Column|Collection require
     * @property Grid\Column|Collection require_dev
     * @property Grid\Column|Collection id
     * @property Grid\Column|Collection username
     * @property Grid\Column|Collection email
     * @property Grid\Column|Collection created_at
     * @property Grid\Column|Collection user_id
     * @property Grid\Column|Collection province
     * @property Grid\Column|Collection city
     * @property Grid\Column|Collection district
     * @property Grid\Column|Collection address
     * @property Grid\Column|Collection zip
     * @property Grid\Column|Collection contact_name
     * @property Grid\Column|Collection contact_phone
     * @property Grid\Column|Collection last_used_at
     * @property Grid\Column|Collection updated_at
     * @property Grid\Column|Collection level
     * @property Grid\Column|Collection path
     * @property Grid\Column|Collection opt
     * @property Grid\Column|Collection image
     * @property Grid\Column|Collection width
     * @property Grid\Column|Collection height
     * @property Grid\Column|Collection cover
     * @property Grid\Column|Collection is_title_show
     * @property Grid\Column|Collection location
     * @property Grid\Column|Collection on_sale
     * @property Grid\Column|Collection price
     * @property Grid\Column|Collection rating
     * @property Grid\Column|Collection sold_count
     * @property Grid\Column|Collection review_count
     * @property Grid\Column|Collection recommend
     * @property Grid\Column|Collection product_id
     * @property Grid\Column|Collection original_price
     * @property Grid\Column|Collection stock
     * @property Grid\Column|Collection crowdfunding
     * @property Grid\Column|Collection target_amount
     * @property Grid\Column|Collection end_at
     * @property Grid\Column|Collection seckill
     * @property Grid\Column|Collection start_at
     * @property Grid\Column|Collection active
     * @property Grid\Column|Collection code
     * @property Grid\Column|Collection type
     * @property Grid\Column|Collection value
     * @property Grid\Column|Collection min_amount
     * @property Grid\Column|Collection total
     * @property Grid\Column|Collection used
     * @property Grid\Column|Collection enabled
     * @property Grid\Column|Collection no
     * @property Grid\Column|Collection total_amount
     * @property Grid\Column|Collection paid_at
     * @property Grid\Column|Collection ship_status
     * @property Grid\Column|Collection refund_status
     * @property Grid\Column|Collection product
     * @property Grid\Column|Collection content
     * @property Grid\Column|Collection body
     * @property Grid\Column|Collection parent_id
     * @property Grid\Column|Collection order
     * @property Grid\Column|Collection icon
     * @property Grid\Column|Collection uri
     * @property Grid\Column|Collection method
     * @property Grid\Column|Collection ip
     * @property Grid\Column|Collection input
     * @property Grid\Column|Collection permission_id
     * @property Grid\Column|Collection menu_id
     * @property Grid\Column|Collection slug
     * @property Grid\Column|Collection http_method
     * @property Grid\Column|Collection http_path
     * @property Grid\Column|Collection role_id
     * @property Grid\Column|Collection password
     * @property Grid\Column|Collection avatar
     * @property Grid\Column|Collection remember_token
     * @property Grid\Column|Collection url
     * @property Grid\Column|Collection merchant_id
     * @property Grid\Column|Collection silder_text
     * @property Grid\Column|Collection start_time
     * @property Grid\Column|Collection end_time
     * @property Grid\Column|Collection jump_link
     * @property Grid\Column|Collection jump_type
     * @property Grid\Column|Collection sort
     * @property Grid\Column|Collection status
     * @property Grid\Column|Collection synopsis
     * @property Grid\Column|Collection sender_id
     * @property Grid\Column|Collection sender_name
     * @property Grid\Column|Collection category_id
     * @property Grid\Column|Collection base_property_id
     * @property Grid\Column|Collection relvalue
     * @property Grid\Column|Collection borrow_id
     * @property Grid\Column|Collection detail
     * @property Grid\Column|Collection person
     * @property Grid\Column|Collection risk
     * @property Grid\Column|Collection img
     * @property Grid\Column|Collection repayment_already_times
     * @property Grid\Column|Collection borrow_invest_id
     * @property Grid\Column|Collection borrow_invest_user_id
     * @property Grid\Column|Collection transfer_money
     * @property Grid\Column|Collection transfer_day
     * @property Grid\Column|Collection transfer_fee
     * @property Grid\Column|Collection transfer_rate
     * @property Grid\Column|Collection deal_id
     * @property Grid\Column|Collection deal_name
     * @property Grid\Column|Collection deal_info
     * @property Grid\Column|Collection deal_time
     * @property Grid\Column|Collection redeal_id
     * @property Grid\Column|Collection redeal_name
     * @property Grid\Column|Collection redeal_info
     * @property Grid\Column|Collection redeal_time
     * @property Grid\Column|Collection borrow_user_id
     * @property Grid\Column|Collection transfer_id
     * @property Grid\Column|Collection invest_sum
     * @property Grid\Column|Collection capital
     * @property Grid\Column|Collection interest
     * @property Grid\Column|Collection receive_capital
     * @property Grid\Column|Collection receive_interest
     * @property Grid\Column|Collection receive_overdue
     * @property Grid\Column|Collection batch
     * @property Grid\Column|Collection help_uid
     * @property Grid\Column|Collection deadline
     * @property Grid\Column|Collection repayment_time
     * @property Grid\Column|Collection company_id
     * @property Grid\Column|Collection duration
     * @property Grid\Column|Collection money
     * @property Grid\Column|Collection rate
     * @property Grid\Column|Collection fee
     * @property Grid\Column|Collection borrow_min
     * @property Grid\Column|Collection borrow_max
     * @property Grid\Column|Collection repayment_times
     * @property Grid\Column|Collection repayment_type
     * @property Grid\Column|Collection collect_day
     * @property Grid\Column|Collection publish_time
     * @property Grid\Column|Collection full_time
     * @property Grid\Column|Collection next_repaytime
     * @property Grid\Column|Collection area
     * @property Grid\Column|Collection use
     * @property Grid\Column|Collection use_other
     * @property Grid\Column|Collection repayment_capital
     * @property Grid\Column|Collection repayment_interest
     * @property Grid\Column|Collection repayment_managefee
     * @property Grid\Column|Collection repayment_overdue
     * @property Grid\Column|Collection brand_id
     * @property Grid\Column|Collection product_sku_id
     * @property Grid\Column|Collection amount
     * @property Grid\Column|Collection is_directory
     * @property Grid\Column|Collection idcard
     * @property Grid\Column|Collection corporation
     * @property Grid\Column|Collection phone
     * @property Grid\Column|Collection yyzz
     * @property Grid\Column|Collection khxkz
     * @property Grid\Column|Collection swdj
     * @property Grid\Column|Collection frsfz
     * @property Grid\Column|Collection not_before
     * @property Grid\Column|Collection not_after
     * @property Grid\Column|Collection coupon_type_id
     * @property Grid\Column|Collection count
     * @property Grid\Column|Collection get_count
     * @property Grid\Column|Collection max_fetch
     * @property Grid\Column|Collection at_least
     * @property Grid\Column|Collection need_user_level
     * @property Grid\Column|Collection range_type
     * @property Grid\Column|Collection get_start_time
     * @property Grid\Column|Collection get_end_time
     * @property Grid\Column|Collection term_of_validity_type
     * @property Grid\Column|Collection fixed_term
     * @property Grid\Column|Collection use_order_id
     * @property Grid\Column|Collection create_order_id
     * @property Grid\Column|Collection get_type
     * @property Grid\Column|Collection state
     * @property Grid\Column|Collection fetch_time
     * @property Grid\Column|Collection use_time
     * @property Grid\Column|Collection user_count
     * @property Grid\Column|Collection connection
     * @property Grid\Column|Collection queue
     * @property Grid\Column|Collection payload
     * @property Grid\Column|Collection exception
     * @property Grid\Column|Collection failed_at
     * @property Grid\Column|Collection news_category_id
     * @property Grid\Column|Collection excerpt
     * @property Grid\Column|Collection news_id
     * @property Grid\Column|Collection notifiable_type
     * @property Grid\Column|Collection notifiable_id
     * @property Grid\Column|Collection data
     * @property Grid\Column|Collection read_at
     * @property Grid\Column|Collection order_type
     * @property Grid\Column|Collection order_count
     * @property Grid\Column|Collection order_id
     * @property Grid\Column|Collection order_sn
     * @property Grid\Column|Collection duty_paragraph
     * @property Grid\Column|Collection opening_bank
     * @property Grid\Column|Collection tax_money
     * @property Grid\Column|Collection review
     * @property Grid\Column|Collection reviewed_at
     * @property Grid\Column|Collection remark
     * @property Grid\Column|Collection coupon_code_id
     * @property Grid\Column|Collection payment_method
     * @property Grid\Column|Collection payment_no
     * @property Grid\Column|Collection refund_no
     * @property Grid\Column|Collection closed
     * @property Grid\Column|Collection reviewed
     * @property Grid\Column|Collection ship_data
     * @property Grid\Column|Collection extra
     * @property Grid\Column|Collection token
     * @property Grid\Column|Collection base_property_item_id
     * @property Grid\Column|Collection prop_value
     * @property Grid\Column|Collection cost_price
     * @property Grid\Column|Collection sku_id
     * @property Grid\Column|Collection discount_num
     * @property Grid\Column|Collection unit
     * @property Grid\Column|Collection supplier_id
     * @property Grid\Column|Collection pid
     * @property Grid\Column|Collection short_title
     * @property Grid\Column|Collection areacode
     * @property Grid\Column|Collection zipcode
     * @property Grid\Column|Collection pinyin
     * @property Grid\Column|Collection lng
     * @property Grid\Column|Collection lat
     * @property Grid\Column|Collection tree
     * @property Grid\Column|Collection logo
     * @property Grid\Column|Collection banner
     * @property Grid\Column|Collection cert
     * @property Grid\Column|Collection covers
     * @property Grid\Column|Collection contact_way
     * @property Grid\Column|Collection reply
     * @property Grid\Column|Collection from
     * @property Grid\Column|Collection sitehelp_type_id
     * @property Grid\Column|Collection desc
     * @property Grid\Column|Collection linkman_tel
     * @property Grid\Column|Collection linkman_name
     * @property Grid\Column|Collection linkman_address
     * @property Grid\Column|Collection payable_type
     * @property Grid\Column|Collection payable_id
     * @property Grid\Column|Collection wallet_id
     * @property Grid\Column|Collection confirmed
     * @property Grid\Column|Collection meta
     * @property Grid\Column|Collection uuid
     * @property Grid\Column|Collection from_type
     * @property Grid\Column|Collection from_id
     * @property Grid\Column|Collection to_type
     * @property Grid\Column|Collection to_id
     * @property Grid\Column|Collection status_last
     * @property Grid\Column|Collection deposit_id
     * @property Grid\Column|Collection withdraw_id
     * @property Grid\Column|Collection discount
     * @property Grid\Column|Collection is_default
     * @property Grid\Column|Collection view_count
     * @property Grid\Column|Collection notification_logo
     * @property Grid\Column|Collection notification_count
     * @property Grid\Column|Collection email_verified_at
     * @property Grid\Column|Collection weixin_openid
     * @property Grid\Column|Collection weapp_openid
     * @property Grid\Column|Collection weixin_session_key
     * @property Grid\Column|Collection weixin_unionid
     * @property Grid\Column|Collection introduction
     * @property Grid\Column|Collection member_level
     * @property Grid\Column|Collection birthday
     * @property Grid\Column|Collection qq
     * @property Grid\Column|Collection gender
     * @property Grid\Column|Collection scores
     * @property Grid\Column|Collection lock
     * @property Grid\Column|Collection holder_type
     * @property Grid\Column|Collection holder_id
     * @property Grid\Column|Collection balance
     * @property Grid\Column|Collection decimal_places
     *
     * @method Grid\Column|Collection name(string $label = null)
     * @method Grid\Column|Collection version(string $label = null)
     * @method Grid\Column|Collection alias(string $label = null)
     * @method Grid\Column|Collection authors(string $label = null)
     * @method Grid\Column|Collection enable(string $label = null)
     * @method Grid\Column|Collection imported(string $label = null)
     * @method Grid\Column|Collection config(string $label = null)
     * @method Grid\Column|Collection require(string $label = null)
     * @method Grid\Column|Collection require_dev(string $label = null)
     * @method Grid\Column|Collection id(string $label = null)
     * @method Grid\Column|Collection username(string $label = null)
     * @method Grid\Column|Collection email(string $label = null)
     * @method Grid\Column|Collection created_at(string $label = null)
     * @method Grid\Column|Collection user_id(string $label = null)
     * @method Grid\Column|Collection province(string $label = null)
     * @method Grid\Column|Collection city(string $label = null)
     * @method Grid\Column|Collection district(string $label = null)
     * @method Grid\Column|Collection address(string $label = null)
     * @method Grid\Column|Collection zip(string $label = null)
     * @method Grid\Column|Collection contact_name(string $label = null)
     * @method Grid\Column|Collection contact_phone(string $label = null)
     * @method Grid\Column|Collection last_used_at(string $label = null)
     * @method Grid\Column|Collection updated_at(string $label = null)
     * @method Grid\Column|Collection level(string $label = null)
     * @method Grid\Column|Collection path(string $label = null)
     * @method Grid\Column|Collection opt(string $label = null)
     * @method Grid\Column|Collection image(string $label = null)
     * @method Grid\Column|Collection width(string $label = null)
     * @method Grid\Column|Collection height(string $label = null)
     * @method Grid\Column|Collection cover(string $label = null)
     * @method Grid\Column|Collection is_title_show(string $label = null)
     * @method Grid\Column|Collection location(string $label = null)
     * @method Grid\Column|Collection on_sale(string $label = null)
     * @method Grid\Column|Collection price(string $label = null)
     * @method Grid\Column|Collection rating(string $label = null)
     * @method Grid\Column|Collection sold_count(string $label = null)
     * @method Grid\Column|Collection review_count(string $label = null)
     * @method Grid\Column|Collection recommend(string $label = null)
     * @method Grid\Column|Collection product_id(string $label = null)
     * @method Grid\Column|Collection original_price(string $label = null)
     * @method Grid\Column|Collection stock(string $label = null)
     * @method Grid\Column|Collection crowdfunding(string $label = null)
     * @method Grid\Column|Collection target_amount(string $label = null)
     * @method Grid\Column|Collection end_at(string $label = null)
     * @method Grid\Column|Collection seckill(string $label = null)
     * @method Grid\Column|Collection start_at(string $label = null)
     * @method Grid\Column|Collection active(string $label = null)
     * @method Grid\Column|Collection code(string $label = null)
     * @method Grid\Column|Collection type(string $label = null)
     * @method Grid\Column|Collection value(string $label = null)
     * @method Grid\Column|Collection min_amount(string $label = null)
     * @method Grid\Column|Collection total(string $label = null)
     * @method Grid\Column|Collection used(string $label = null)
     * @method Grid\Column|Collection enabled(string $label = null)
     * @method Grid\Column|Collection no(string $label = null)
     * @method Grid\Column|Collection total_amount(string $label = null)
     * @method Grid\Column|Collection paid_at(string $label = null)
     * @method Grid\Column|Collection ship_status(string $label = null)
     * @method Grid\Column|Collection refund_status(string $label = null)
     * @method Grid\Column|Collection product(string $label = null)
     * @method Grid\Column|Collection content(string $label = null)
     * @method Grid\Column|Collection body(string $label = null)
     * @method Grid\Column|Collection parent_id(string $label = null)
     * @method Grid\Column|Collection order(string $label = null)
     * @method Grid\Column|Collection icon(string $label = null)
     * @method Grid\Column|Collection uri(string $label = null)
     * @method Grid\Column|Collection method(string $label = null)
     * @method Grid\Column|Collection ip(string $label = null)
     * @method Grid\Column|Collection input(string $label = null)
     * @method Grid\Column|Collection permission_id(string $label = null)
     * @method Grid\Column|Collection menu_id(string $label = null)
     * @method Grid\Column|Collection slug(string $label = null)
     * @method Grid\Column|Collection http_method(string $label = null)
     * @method Grid\Column|Collection http_path(string $label = null)
     * @method Grid\Column|Collection role_id(string $label = null)
     * @method Grid\Column|Collection password(string $label = null)
     * @method Grid\Column|Collection avatar(string $label = null)
     * @method Grid\Column|Collection remember_token(string $label = null)
     * @method Grid\Column|Collection url(string $label = null)
     * @method Grid\Column|Collection merchant_id(string $label = null)
     * @method Grid\Column|Collection silder_text(string $label = null)
     * @method Grid\Column|Collection start_time(string $label = null)
     * @method Grid\Column|Collection end_time(string $label = null)
     * @method Grid\Column|Collection jump_link(string $label = null)
     * @method Grid\Column|Collection jump_type(string $label = null)
     * @method Grid\Column|Collection sort(string $label = null)
     * @method Grid\Column|Collection status(string $label = null)
     * @method Grid\Column|Collection synopsis(string $label = null)
     * @method Grid\Column|Collection sender_id(string $label = null)
     * @method Grid\Column|Collection sender_name(string $label = null)
     * @method Grid\Column|Collection category_id(string $label = null)
     * @method Grid\Column|Collection base_property_id(string $label = null)
     * @method Grid\Column|Collection relvalue(string $label = null)
     * @method Grid\Column|Collection borrow_id(string $label = null)
     * @method Grid\Column|Collection detail(string $label = null)
     * @method Grid\Column|Collection person(string $label = null)
     * @method Grid\Column|Collection risk(string $label = null)
     * @method Grid\Column|Collection img(string $label = null)
     * @method Grid\Column|Collection repayment_already_times(string $label = null)
     * @method Grid\Column|Collection borrow_invest_id(string $label = null)
     * @method Grid\Column|Collection borrow_invest_user_id(string $label = null)
     * @method Grid\Column|Collection transfer_money(string $label = null)
     * @method Grid\Column|Collection transfer_day(string $label = null)
     * @method Grid\Column|Collection transfer_fee(string $label = null)
     * @method Grid\Column|Collection transfer_rate(string $label = null)
     * @method Grid\Column|Collection deal_id(string $label = null)
     * @method Grid\Column|Collection deal_name(string $label = null)
     * @method Grid\Column|Collection deal_info(string $label = null)
     * @method Grid\Column|Collection deal_time(string $label = null)
     * @method Grid\Column|Collection redeal_id(string $label = null)
     * @method Grid\Column|Collection redeal_name(string $label = null)
     * @method Grid\Column|Collection redeal_info(string $label = null)
     * @method Grid\Column|Collection redeal_time(string $label = null)
     * @method Grid\Column|Collection borrow_user_id(string $label = null)
     * @method Grid\Column|Collection transfer_id(string $label = null)
     * @method Grid\Column|Collection invest_sum(string $label = null)
     * @method Grid\Column|Collection capital(string $label = null)
     * @method Grid\Column|Collection interest(string $label = null)
     * @method Grid\Column|Collection receive_capital(string $label = null)
     * @method Grid\Column|Collection receive_interest(string $label = null)
     * @method Grid\Column|Collection receive_overdue(string $label = null)
     * @method Grid\Column|Collection batch(string $label = null)
     * @method Grid\Column|Collection help_uid(string $label = null)
     * @method Grid\Column|Collection deadline(string $label = null)
     * @method Grid\Column|Collection repayment_time(string $label = null)
     * @method Grid\Column|Collection company_id(string $label = null)
     * @method Grid\Column|Collection duration(string $label = null)
     * @method Grid\Column|Collection money(string $label = null)
     * @method Grid\Column|Collection rate(string $label = null)
     * @method Grid\Column|Collection fee(string $label = null)
     * @method Grid\Column|Collection borrow_min(string $label = null)
     * @method Grid\Column|Collection borrow_max(string $label = null)
     * @method Grid\Column|Collection repayment_times(string $label = null)
     * @method Grid\Column|Collection repayment_type(string $label = null)
     * @method Grid\Column|Collection collect_day(string $label = null)
     * @method Grid\Column|Collection publish_time(string $label = null)
     * @method Grid\Column|Collection full_time(string $label = null)
     * @method Grid\Column|Collection next_repaytime(string $label = null)
     * @method Grid\Column|Collection area(string $label = null)
     * @method Grid\Column|Collection use(string $label = null)
     * @method Grid\Column|Collection use_other(string $label = null)
     * @method Grid\Column|Collection repayment_capital(string $label = null)
     * @method Grid\Column|Collection repayment_interest(string $label = null)
     * @method Grid\Column|Collection repayment_managefee(string $label = null)
     * @method Grid\Column|Collection repayment_overdue(string $label = null)
     * @method Grid\Column|Collection brand_id(string $label = null)
     * @method Grid\Column|Collection product_sku_id(string $label = null)
     * @method Grid\Column|Collection amount(string $label = null)
     * @method Grid\Column|Collection is_directory(string $label = null)
     * @method Grid\Column|Collection idcard(string $label = null)
     * @method Grid\Column|Collection corporation(string $label = null)
     * @method Grid\Column|Collection phone(string $label = null)
     * @method Grid\Column|Collection yyzz(string $label = null)
     * @method Grid\Column|Collection khxkz(string $label = null)
     * @method Grid\Column|Collection swdj(string $label = null)
     * @method Grid\Column|Collection frsfz(string $label = null)
     * @method Grid\Column|Collection not_before(string $label = null)
     * @method Grid\Column|Collection not_after(string $label = null)
     * @method Grid\Column|Collection coupon_type_id(string $label = null)
     * @method Grid\Column|Collection count(string $label = null)
     * @method Grid\Column|Collection get_count(string $label = null)
     * @method Grid\Column|Collection max_fetch(string $label = null)
     * @method Grid\Column|Collection at_least(string $label = null)
     * @method Grid\Column|Collection need_user_level(string $label = null)
     * @method Grid\Column|Collection range_type(string $label = null)
     * @method Grid\Column|Collection get_start_time(string $label = null)
     * @method Grid\Column|Collection get_end_time(string $label = null)
     * @method Grid\Column|Collection term_of_validity_type(string $label = null)
     * @method Grid\Column|Collection fixed_term(string $label = null)
     * @method Grid\Column|Collection use_order_id(string $label = null)
     * @method Grid\Column|Collection create_order_id(string $label = null)
     * @method Grid\Column|Collection get_type(string $label = null)
     * @method Grid\Column|Collection state(string $label = null)
     * @method Grid\Column|Collection fetch_time(string $label = null)
     * @method Grid\Column|Collection use_time(string $label = null)
     * @method Grid\Column|Collection user_count(string $label = null)
     * @method Grid\Column|Collection connection(string $label = null)
     * @method Grid\Column|Collection queue(string $label = null)
     * @method Grid\Column|Collection payload(string $label = null)
     * @method Grid\Column|Collection exception(string $label = null)
     * @method Grid\Column|Collection failed_at(string $label = null)
     * @method Grid\Column|Collection news_category_id(string $label = null)
     * @method Grid\Column|Collection excerpt(string $label = null)
     * @method Grid\Column|Collection news_id(string $label = null)
     * @method Grid\Column|Collection notifiable_type(string $label = null)
     * @method Grid\Column|Collection notifiable_id(string $label = null)
     * @method Grid\Column|Collection data(string $label = null)
     * @method Grid\Column|Collection read_at(string $label = null)
     * @method Grid\Column|Collection order_type(string $label = null)
     * @method Grid\Column|Collection order_count(string $label = null)
     * @method Grid\Column|Collection order_id(string $label = null)
     * @method Grid\Column|Collection order_sn(string $label = null)
     * @method Grid\Column|Collection duty_paragraph(string $label = null)
     * @method Grid\Column|Collection opening_bank(string $label = null)
     * @method Grid\Column|Collection tax_money(string $label = null)
     * @method Grid\Column|Collection review(string $label = null)
     * @method Grid\Column|Collection reviewed_at(string $label = null)
     * @method Grid\Column|Collection remark(string $label = null)
     * @method Grid\Column|Collection coupon_code_id(string $label = null)
     * @method Grid\Column|Collection payment_method(string $label = null)
     * @method Grid\Column|Collection payment_no(string $label = null)
     * @method Grid\Column|Collection refund_no(string $label = null)
     * @method Grid\Column|Collection closed(string $label = null)
     * @method Grid\Column|Collection reviewed(string $label = null)
     * @method Grid\Column|Collection ship_data(string $label = null)
     * @method Grid\Column|Collection extra(string $label = null)
     * @method Grid\Column|Collection token(string $label = null)
     * @method Grid\Column|Collection base_property_item_id(string $label = null)
     * @method Grid\Column|Collection prop_value(string $label = null)
     * @method Grid\Column|Collection cost_price(string $label = null)
     * @method Grid\Column|Collection sku_id(string $label = null)
     * @method Grid\Column|Collection discount_num(string $label = null)
     * @method Grid\Column|Collection unit(string $label = null)
     * @method Grid\Column|Collection supplier_id(string $label = null)
     * @method Grid\Column|Collection pid(string $label = null)
     * @method Grid\Column|Collection short_title(string $label = null)
     * @method Grid\Column|Collection areacode(string $label = null)
     * @method Grid\Column|Collection zipcode(string $label = null)
     * @method Grid\Column|Collection pinyin(string $label = null)
     * @method Grid\Column|Collection lng(string $label = null)
     * @method Grid\Column|Collection lat(string $label = null)
     * @method Grid\Column|Collection tree(string $label = null)
     * @method Grid\Column|Collection logo(string $label = null)
     * @method Grid\Column|Collection banner(string $label = null)
     * @method Grid\Column|Collection cert(string $label = null)
     * @method Grid\Column|Collection covers(string $label = null)
     * @method Grid\Column|Collection contact_way(string $label = null)
     * @method Grid\Column|Collection reply(string $label = null)
     * @method Grid\Column|Collection from(string $label = null)
     * @method Grid\Column|Collection sitehelp_type_id(string $label = null)
     * @method Grid\Column|Collection desc(string $label = null)
     * @method Grid\Column|Collection linkman_tel(string $label = null)
     * @method Grid\Column|Collection linkman_name(string $label = null)
     * @method Grid\Column|Collection linkman_address(string $label = null)
     * @method Grid\Column|Collection payable_type(string $label = null)
     * @method Grid\Column|Collection payable_id(string $label = null)
     * @method Grid\Column|Collection wallet_id(string $label = null)
     * @method Grid\Column|Collection confirmed(string $label = null)
     * @method Grid\Column|Collection meta(string $label = null)
     * @method Grid\Column|Collection uuid(string $label = null)
     * @method Grid\Column|Collection from_type(string $label = null)
     * @method Grid\Column|Collection from_id(string $label = null)
     * @method Grid\Column|Collection to_type(string $label = null)
     * @method Grid\Column|Collection to_id(string $label = null)
     * @method Grid\Column|Collection status_last(string $label = null)
     * @method Grid\Column|Collection deposit_id(string $label = null)
     * @method Grid\Column|Collection withdraw_id(string $label = null)
     * @method Grid\Column|Collection discount(string $label = null)
     * @method Grid\Column|Collection is_default(string $label = null)
     * @method Grid\Column|Collection view_count(string $label = null)
     * @method Grid\Column|Collection notification_logo(string $label = null)
     * @method Grid\Column|Collection notification_count(string $label = null)
     * @method Grid\Column|Collection email_verified_at(string $label = null)
     * @method Grid\Column|Collection weixin_openid(string $label = null)
     * @method Grid\Column|Collection weapp_openid(string $label = null)
     * @method Grid\Column|Collection weixin_session_key(string $label = null)
     * @method Grid\Column|Collection weixin_unionid(string $label = null)
     * @method Grid\Column|Collection introduction(string $label = null)
     * @method Grid\Column|Collection member_level(string $label = null)
     * @method Grid\Column|Collection birthday(string $label = null)
     * @method Grid\Column|Collection qq(string $label = null)
     * @method Grid\Column|Collection gender(string $label = null)
     * @method Grid\Column|Collection scores(string $label = null)
     * @method Grid\Column|Collection lock(string $label = null)
     * @method Grid\Column|Collection holder_type(string $label = null)
     * @method Grid\Column|Collection holder_id(string $label = null)
     * @method Grid\Column|Collection balance(string $label = null)
     * @method Grid\Column|Collection decimal_places(string $label = null)
     */
    class Grid {}

    class MiniGrid extends Grid {}

    /**
     * @property Show\Field|Collection name
     * @property Show\Field|Collection version
     * @property Show\Field|Collection alias
     * @property Show\Field|Collection authors
     * @property Show\Field|Collection enable
     * @property Show\Field|Collection imported
     * @property Show\Field|Collection config
     * @property Show\Field|Collection require
     * @property Show\Field|Collection require_dev
     * @property Show\Field|Collection id
     * @property Show\Field|Collection username
     * @property Show\Field|Collection email
     * @property Show\Field|Collection created_at
     * @property Show\Field|Collection user_id
     * @property Show\Field|Collection province
     * @property Show\Field|Collection city
     * @property Show\Field|Collection district
     * @property Show\Field|Collection address
     * @property Show\Field|Collection zip
     * @property Show\Field|Collection contact_name
     * @property Show\Field|Collection contact_phone
     * @property Show\Field|Collection last_used_at
     * @property Show\Field|Collection updated_at
     * @property Show\Field|Collection level
     * @property Show\Field|Collection path
     * @property Show\Field|Collection opt
     * @property Show\Field|Collection image
     * @property Show\Field|Collection width
     * @property Show\Field|Collection height
     * @property Show\Field|Collection cover
     * @property Show\Field|Collection is_title_show
     * @property Show\Field|Collection location
     * @property Show\Field|Collection on_sale
     * @property Show\Field|Collection price
     * @property Show\Field|Collection rating
     * @property Show\Field|Collection sold_count
     * @property Show\Field|Collection review_count
     * @property Show\Field|Collection recommend
     * @property Show\Field|Collection product_id
     * @property Show\Field|Collection original_price
     * @property Show\Field|Collection stock
     * @property Show\Field|Collection crowdfunding
     * @property Show\Field|Collection target_amount
     * @property Show\Field|Collection end_at
     * @property Show\Field|Collection seckill
     * @property Show\Field|Collection start_at
     * @property Show\Field|Collection active
     * @property Show\Field|Collection code
     * @property Show\Field|Collection type
     * @property Show\Field|Collection value
     * @property Show\Field|Collection min_amount
     * @property Show\Field|Collection total
     * @property Show\Field|Collection used
     * @property Show\Field|Collection enabled
     * @property Show\Field|Collection no
     * @property Show\Field|Collection total_amount
     * @property Show\Field|Collection paid_at
     * @property Show\Field|Collection ship_status
     * @property Show\Field|Collection refund_status
     * @property Show\Field|Collection product
     * @property Show\Field|Collection content
     * @property Show\Field|Collection body
     * @property Show\Field|Collection parent_id
     * @property Show\Field|Collection order
     * @property Show\Field|Collection icon
     * @property Show\Field|Collection uri
     * @property Show\Field|Collection method
     * @property Show\Field|Collection ip
     * @property Show\Field|Collection input
     * @property Show\Field|Collection permission_id
     * @property Show\Field|Collection menu_id
     * @property Show\Field|Collection slug
     * @property Show\Field|Collection http_method
     * @property Show\Field|Collection http_path
     * @property Show\Field|Collection role_id
     * @property Show\Field|Collection password
     * @property Show\Field|Collection avatar
     * @property Show\Field|Collection remember_token
     * @property Show\Field|Collection url
     * @property Show\Field|Collection merchant_id
     * @property Show\Field|Collection silder_text
     * @property Show\Field|Collection start_time
     * @property Show\Field|Collection end_time
     * @property Show\Field|Collection jump_link
     * @property Show\Field|Collection jump_type
     * @property Show\Field|Collection sort
     * @property Show\Field|Collection status
     * @property Show\Field|Collection synopsis
     * @property Show\Field|Collection sender_id
     * @property Show\Field|Collection sender_name
     * @property Show\Field|Collection category_id
     * @property Show\Field|Collection base_property_id
     * @property Show\Field|Collection relvalue
     * @property Show\Field|Collection borrow_id
     * @property Show\Field|Collection detail
     * @property Show\Field|Collection person
     * @property Show\Field|Collection risk
     * @property Show\Field|Collection img
     * @property Show\Field|Collection repayment_already_times
     * @property Show\Field|Collection borrow_invest_id
     * @property Show\Field|Collection borrow_invest_user_id
     * @property Show\Field|Collection transfer_money
     * @property Show\Field|Collection transfer_day
     * @property Show\Field|Collection transfer_fee
     * @property Show\Field|Collection transfer_rate
     * @property Show\Field|Collection deal_id
     * @property Show\Field|Collection deal_name
     * @property Show\Field|Collection deal_info
     * @property Show\Field|Collection deal_time
     * @property Show\Field|Collection redeal_id
     * @property Show\Field|Collection redeal_name
     * @property Show\Field|Collection redeal_info
     * @property Show\Field|Collection redeal_time
     * @property Show\Field|Collection borrow_user_id
     * @property Show\Field|Collection transfer_id
     * @property Show\Field|Collection invest_sum
     * @property Show\Field|Collection capital
     * @property Show\Field|Collection interest
     * @property Show\Field|Collection receive_capital
     * @property Show\Field|Collection receive_interest
     * @property Show\Field|Collection receive_overdue
     * @property Show\Field|Collection batch
     * @property Show\Field|Collection help_uid
     * @property Show\Field|Collection deadline
     * @property Show\Field|Collection repayment_time
     * @property Show\Field|Collection company_id
     * @property Show\Field|Collection duration
     * @property Show\Field|Collection money
     * @property Show\Field|Collection rate
     * @property Show\Field|Collection fee
     * @property Show\Field|Collection borrow_min
     * @property Show\Field|Collection borrow_max
     * @property Show\Field|Collection repayment_times
     * @property Show\Field|Collection repayment_type
     * @property Show\Field|Collection collect_day
     * @property Show\Field|Collection publish_time
     * @property Show\Field|Collection full_time
     * @property Show\Field|Collection next_repaytime
     * @property Show\Field|Collection area
     * @property Show\Field|Collection use
     * @property Show\Field|Collection use_other
     * @property Show\Field|Collection repayment_capital
     * @property Show\Field|Collection repayment_interest
     * @property Show\Field|Collection repayment_managefee
     * @property Show\Field|Collection repayment_overdue
     * @property Show\Field|Collection brand_id
     * @property Show\Field|Collection product_sku_id
     * @property Show\Field|Collection amount
     * @property Show\Field|Collection is_directory
     * @property Show\Field|Collection idcard
     * @property Show\Field|Collection corporation
     * @property Show\Field|Collection phone
     * @property Show\Field|Collection yyzz
     * @property Show\Field|Collection khxkz
     * @property Show\Field|Collection swdj
     * @property Show\Field|Collection frsfz
     * @property Show\Field|Collection not_before
     * @property Show\Field|Collection not_after
     * @property Show\Field|Collection coupon_type_id
     * @property Show\Field|Collection count
     * @property Show\Field|Collection get_count
     * @property Show\Field|Collection max_fetch
     * @property Show\Field|Collection at_least
     * @property Show\Field|Collection need_user_level
     * @property Show\Field|Collection range_type
     * @property Show\Field|Collection get_start_time
     * @property Show\Field|Collection get_end_time
     * @property Show\Field|Collection term_of_validity_type
     * @property Show\Field|Collection fixed_term
     * @property Show\Field|Collection use_order_id
     * @property Show\Field|Collection create_order_id
     * @property Show\Field|Collection get_type
     * @property Show\Field|Collection state
     * @property Show\Field|Collection fetch_time
     * @property Show\Field|Collection use_time
     * @property Show\Field|Collection user_count
     * @property Show\Field|Collection connection
     * @property Show\Field|Collection queue
     * @property Show\Field|Collection payload
     * @property Show\Field|Collection exception
     * @property Show\Field|Collection failed_at
     * @property Show\Field|Collection news_category_id
     * @property Show\Field|Collection excerpt
     * @property Show\Field|Collection news_id
     * @property Show\Field|Collection notifiable_type
     * @property Show\Field|Collection notifiable_id
     * @property Show\Field|Collection data
     * @property Show\Field|Collection read_at
     * @property Show\Field|Collection order_type
     * @property Show\Field|Collection order_count
     * @property Show\Field|Collection order_id
     * @property Show\Field|Collection order_sn
     * @property Show\Field|Collection duty_paragraph
     * @property Show\Field|Collection opening_bank
     * @property Show\Field|Collection tax_money
     * @property Show\Field|Collection review
     * @property Show\Field|Collection reviewed_at
     * @property Show\Field|Collection remark
     * @property Show\Field|Collection coupon_code_id
     * @property Show\Field|Collection payment_method
     * @property Show\Field|Collection payment_no
     * @property Show\Field|Collection refund_no
     * @property Show\Field|Collection closed
     * @property Show\Field|Collection reviewed
     * @property Show\Field|Collection ship_data
     * @property Show\Field|Collection extra
     * @property Show\Field|Collection token
     * @property Show\Field|Collection base_property_item_id
     * @property Show\Field|Collection prop_value
     * @property Show\Field|Collection cost_price
     * @property Show\Field|Collection sku_id
     * @property Show\Field|Collection discount_num
     * @property Show\Field|Collection unit
     * @property Show\Field|Collection supplier_id
     * @property Show\Field|Collection pid
     * @property Show\Field|Collection short_title
     * @property Show\Field|Collection areacode
     * @property Show\Field|Collection zipcode
     * @property Show\Field|Collection pinyin
     * @property Show\Field|Collection lng
     * @property Show\Field|Collection lat
     * @property Show\Field|Collection tree
     * @property Show\Field|Collection logo
     * @property Show\Field|Collection banner
     * @property Show\Field|Collection cert
     * @property Show\Field|Collection covers
     * @property Show\Field|Collection contact_way
     * @property Show\Field|Collection reply
     * @property Show\Field|Collection from
     * @property Show\Field|Collection sitehelp_type_id
     * @property Show\Field|Collection desc
     * @property Show\Field|Collection linkman_tel
     * @property Show\Field|Collection linkman_name
     * @property Show\Field|Collection linkman_address
     * @property Show\Field|Collection payable_type
     * @property Show\Field|Collection payable_id
     * @property Show\Field|Collection wallet_id
     * @property Show\Field|Collection confirmed
     * @property Show\Field|Collection meta
     * @property Show\Field|Collection uuid
     * @property Show\Field|Collection from_type
     * @property Show\Field|Collection from_id
     * @property Show\Field|Collection to_type
     * @property Show\Field|Collection to_id
     * @property Show\Field|Collection status_last
     * @property Show\Field|Collection deposit_id
     * @property Show\Field|Collection withdraw_id
     * @property Show\Field|Collection discount
     * @property Show\Field|Collection is_default
     * @property Show\Field|Collection view_count
     * @property Show\Field|Collection notification_logo
     * @property Show\Field|Collection notification_count
     * @property Show\Field|Collection email_verified_at
     * @property Show\Field|Collection weixin_openid
     * @property Show\Field|Collection weapp_openid
     * @property Show\Field|Collection weixin_session_key
     * @property Show\Field|Collection weixin_unionid
     * @property Show\Field|Collection introduction
     * @property Show\Field|Collection member_level
     * @property Show\Field|Collection birthday
     * @property Show\Field|Collection qq
     * @property Show\Field|Collection gender
     * @property Show\Field|Collection scores
     * @property Show\Field|Collection lock
     * @property Show\Field|Collection holder_type
     * @property Show\Field|Collection holder_id
     * @property Show\Field|Collection balance
     * @property Show\Field|Collection decimal_places
     *
     * @method Show\Field|Collection name(string $label = null)
     * @method Show\Field|Collection version(string $label = null)
     * @method Show\Field|Collection alias(string $label = null)
     * @method Show\Field|Collection authors(string $label = null)
     * @method Show\Field|Collection enable(string $label = null)
     * @method Show\Field|Collection imported(string $label = null)
     * @method Show\Field|Collection config(string $label = null)
     * @method Show\Field|Collection require(string $label = null)
     * @method Show\Field|Collection require_dev(string $label = null)
     * @method Show\Field|Collection id(string $label = null)
     * @method Show\Field|Collection username(string $label = null)
     * @method Show\Field|Collection email(string $label = null)
     * @method Show\Field|Collection created_at(string $label = null)
     * @method Show\Field|Collection user_id(string $label = null)
     * @method Show\Field|Collection province(string $label = null)
     * @method Show\Field|Collection city(string $label = null)
     * @method Show\Field|Collection district(string $label = null)
     * @method Show\Field|Collection address(string $label = null)
     * @method Show\Field|Collection zip(string $label = null)
     * @method Show\Field|Collection contact_name(string $label = null)
     * @method Show\Field|Collection contact_phone(string $label = null)
     * @method Show\Field|Collection last_used_at(string $label = null)
     * @method Show\Field|Collection updated_at(string $label = null)
     * @method Show\Field|Collection level(string $label = null)
     * @method Show\Field|Collection path(string $label = null)
     * @method Show\Field|Collection opt(string $label = null)
     * @method Show\Field|Collection image(string $label = null)
     * @method Show\Field|Collection width(string $label = null)
     * @method Show\Field|Collection height(string $label = null)
     * @method Show\Field|Collection cover(string $label = null)
     * @method Show\Field|Collection is_title_show(string $label = null)
     * @method Show\Field|Collection location(string $label = null)
     * @method Show\Field|Collection on_sale(string $label = null)
     * @method Show\Field|Collection price(string $label = null)
     * @method Show\Field|Collection rating(string $label = null)
     * @method Show\Field|Collection sold_count(string $label = null)
     * @method Show\Field|Collection review_count(string $label = null)
     * @method Show\Field|Collection recommend(string $label = null)
     * @method Show\Field|Collection product_id(string $label = null)
     * @method Show\Field|Collection original_price(string $label = null)
     * @method Show\Field|Collection stock(string $label = null)
     * @method Show\Field|Collection crowdfunding(string $label = null)
     * @method Show\Field|Collection target_amount(string $label = null)
     * @method Show\Field|Collection end_at(string $label = null)
     * @method Show\Field|Collection seckill(string $label = null)
     * @method Show\Field|Collection start_at(string $label = null)
     * @method Show\Field|Collection active(string $label = null)
     * @method Show\Field|Collection code(string $label = null)
     * @method Show\Field|Collection type(string $label = null)
     * @method Show\Field|Collection value(string $label = null)
     * @method Show\Field|Collection min_amount(string $label = null)
     * @method Show\Field|Collection total(string $label = null)
     * @method Show\Field|Collection used(string $label = null)
     * @method Show\Field|Collection enabled(string $label = null)
     * @method Show\Field|Collection no(string $label = null)
     * @method Show\Field|Collection total_amount(string $label = null)
     * @method Show\Field|Collection paid_at(string $label = null)
     * @method Show\Field|Collection ship_status(string $label = null)
     * @method Show\Field|Collection refund_status(string $label = null)
     * @method Show\Field|Collection product(string $label = null)
     * @method Show\Field|Collection content(string $label = null)
     * @method Show\Field|Collection body(string $label = null)
     * @method Show\Field|Collection parent_id(string $label = null)
     * @method Show\Field|Collection order(string $label = null)
     * @method Show\Field|Collection icon(string $label = null)
     * @method Show\Field|Collection uri(string $label = null)
     * @method Show\Field|Collection method(string $label = null)
     * @method Show\Field|Collection ip(string $label = null)
     * @method Show\Field|Collection input(string $label = null)
     * @method Show\Field|Collection permission_id(string $label = null)
     * @method Show\Field|Collection menu_id(string $label = null)
     * @method Show\Field|Collection slug(string $label = null)
     * @method Show\Field|Collection http_method(string $label = null)
     * @method Show\Field|Collection http_path(string $label = null)
     * @method Show\Field|Collection role_id(string $label = null)
     * @method Show\Field|Collection password(string $label = null)
     * @method Show\Field|Collection avatar(string $label = null)
     * @method Show\Field|Collection remember_token(string $label = null)
     * @method Show\Field|Collection url(string $label = null)
     * @method Show\Field|Collection merchant_id(string $label = null)
     * @method Show\Field|Collection silder_text(string $label = null)
     * @method Show\Field|Collection start_time(string $label = null)
     * @method Show\Field|Collection end_time(string $label = null)
     * @method Show\Field|Collection jump_link(string $label = null)
     * @method Show\Field|Collection jump_type(string $label = null)
     * @method Show\Field|Collection sort(string $label = null)
     * @method Show\Field|Collection status(string $label = null)
     * @method Show\Field|Collection synopsis(string $label = null)
     * @method Show\Field|Collection sender_id(string $label = null)
     * @method Show\Field|Collection sender_name(string $label = null)
     * @method Show\Field|Collection category_id(string $label = null)
     * @method Show\Field|Collection base_property_id(string $label = null)
     * @method Show\Field|Collection relvalue(string $label = null)
     * @method Show\Field|Collection borrow_id(string $label = null)
     * @method Show\Field|Collection detail(string $label = null)
     * @method Show\Field|Collection person(string $label = null)
     * @method Show\Field|Collection risk(string $label = null)
     * @method Show\Field|Collection img(string $label = null)
     * @method Show\Field|Collection repayment_already_times(string $label = null)
     * @method Show\Field|Collection borrow_invest_id(string $label = null)
     * @method Show\Field|Collection borrow_invest_user_id(string $label = null)
     * @method Show\Field|Collection transfer_money(string $label = null)
     * @method Show\Field|Collection transfer_day(string $label = null)
     * @method Show\Field|Collection transfer_fee(string $label = null)
     * @method Show\Field|Collection transfer_rate(string $label = null)
     * @method Show\Field|Collection deal_id(string $label = null)
     * @method Show\Field|Collection deal_name(string $label = null)
     * @method Show\Field|Collection deal_info(string $label = null)
     * @method Show\Field|Collection deal_time(string $label = null)
     * @method Show\Field|Collection redeal_id(string $label = null)
     * @method Show\Field|Collection redeal_name(string $label = null)
     * @method Show\Field|Collection redeal_info(string $label = null)
     * @method Show\Field|Collection redeal_time(string $label = null)
     * @method Show\Field|Collection borrow_user_id(string $label = null)
     * @method Show\Field|Collection transfer_id(string $label = null)
     * @method Show\Field|Collection invest_sum(string $label = null)
     * @method Show\Field|Collection capital(string $label = null)
     * @method Show\Field|Collection interest(string $label = null)
     * @method Show\Field|Collection receive_capital(string $label = null)
     * @method Show\Field|Collection receive_interest(string $label = null)
     * @method Show\Field|Collection receive_overdue(string $label = null)
     * @method Show\Field|Collection batch(string $label = null)
     * @method Show\Field|Collection help_uid(string $label = null)
     * @method Show\Field|Collection deadline(string $label = null)
     * @method Show\Field|Collection repayment_time(string $label = null)
     * @method Show\Field|Collection company_id(string $label = null)
     * @method Show\Field|Collection duration(string $label = null)
     * @method Show\Field|Collection money(string $label = null)
     * @method Show\Field|Collection rate(string $label = null)
     * @method Show\Field|Collection fee(string $label = null)
     * @method Show\Field|Collection borrow_min(string $label = null)
     * @method Show\Field|Collection borrow_max(string $label = null)
     * @method Show\Field|Collection repayment_times(string $label = null)
     * @method Show\Field|Collection repayment_type(string $label = null)
     * @method Show\Field|Collection collect_day(string $label = null)
     * @method Show\Field|Collection publish_time(string $label = null)
     * @method Show\Field|Collection full_time(string $label = null)
     * @method Show\Field|Collection next_repaytime(string $label = null)
     * @method Show\Field|Collection area(string $label = null)
     * @method Show\Field|Collection use(string $label = null)
     * @method Show\Field|Collection use_other(string $label = null)
     * @method Show\Field|Collection repayment_capital(string $label = null)
     * @method Show\Field|Collection repayment_interest(string $label = null)
     * @method Show\Field|Collection repayment_managefee(string $label = null)
     * @method Show\Field|Collection repayment_overdue(string $label = null)
     * @method Show\Field|Collection brand_id(string $label = null)
     * @method Show\Field|Collection product_sku_id(string $label = null)
     * @method Show\Field|Collection amount(string $label = null)
     * @method Show\Field|Collection is_directory(string $label = null)
     * @method Show\Field|Collection idcard(string $label = null)
     * @method Show\Field|Collection corporation(string $label = null)
     * @method Show\Field|Collection phone(string $label = null)
     * @method Show\Field|Collection yyzz(string $label = null)
     * @method Show\Field|Collection khxkz(string $label = null)
     * @method Show\Field|Collection swdj(string $label = null)
     * @method Show\Field|Collection frsfz(string $label = null)
     * @method Show\Field|Collection not_before(string $label = null)
     * @method Show\Field|Collection not_after(string $label = null)
     * @method Show\Field|Collection coupon_type_id(string $label = null)
     * @method Show\Field|Collection count(string $label = null)
     * @method Show\Field|Collection get_count(string $label = null)
     * @method Show\Field|Collection max_fetch(string $label = null)
     * @method Show\Field|Collection at_least(string $label = null)
     * @method Show\Field|Collection need_user_level(string $label = null)
     * @method Show\Field|Collection range_type(string $label = null)
     * @method Show\Field|Collection get_start_time(string $label = null)
     * @method Show\Field|Collection get_end_time(string $label = null)
     * @method Show\Field|Collection term_of_validity_type(string $label = null)
     * @method Show\Field|Collection fixed_term(string $label = null)
     * @method Show\Field|Collection use_order_id(string $label = null)
     * @method Show\Field|Collection create_order_id(string $label = null)
     * @method Show\Field|Collection get_type(string $label = null)
     * @method Show\Field|Collection state(string $label = null)
     * @method Show\Field|Collection fetch_time(string $label = null)
     * @method Show\Field|Collection use_time(string $label = null)
     * @method Show\Field|Collection user_count(string $label = null)
     * @method Show\Field|Collection connection(string $label = null)
     * @method Show\Field|Collection queue(string $label = null)
     * @method Show\Field|Collection payload(string $label = null)
     * @method Show\Field|Collection exception(string $label = null)
     * @method Show\Field|Collection failed_at(string $label = null)
     * @method Show\Field|Collection news_category_id(string $label = null)
     * @method Show\Field|Collection excerpt(string $label = null)
     * @method Show\Field|Collection news_id(string $label = null)
     * @method Show\Field|Collection notifiable_type(string $label = null)
     * @method Show\Field|Collection notifiable_id(string $label = null)
     * @method Show\Field|Collection data(string $label = null)
     * @method Show\Field|Collection read_at(string $label = null)
     * @method Show\Field|Collection order_type(string $label = null)
     * @method Show\Field|Collection order_count(string $label = null)
     * @method Show\Field|Collection order_id(string $label = null)
     * @method Show\Field|Collection order_sn(string $label = null)
     * @method Show\Field|Collection duty_paragraph(string $label = null)
     * @method Show\Field|Collection opening_bank(string $label = null)
     * @method Show\Field|Collection tax_money(string $label = null)
     * @method Show\Field|Collection review(string $label = null)
     * @method Show\Field|Collection reviewed_at(string $label = null)
     * @method Show\Field|Collection remark(string $label = null)
     * @method Show\Field|Collection coupon_code_id(string $label = null)
     * @method Show\Field|Collection payment_method(string $label = null)
     * @method Show\Field|Collection payment_no(string $label = null)
     * @method Show\Field|Collection refund_no(string $label = null)
     * @method Show\Field|Collection closed(string $label = null)
     * @method Show\Field|Collection reviewed(string $label = null)
     * @method Show\Field|Collection ship_data(string $label = null)
     * @method Show\Field|Collection extra(string $label = null)
     * @method Show\Field|Collection token(string $label = null)
     * @method Show\Field|Collection base_property_item_id(string $label = null)
     * @method Show\Field|Collection prop_value(string $label = null)
     * @method Show\Field|Collection cost_price(string $label = null)
     * @method Show\Field|Collection sku_id(string $label = null)
     * @method Show\Field|Collection discount_num(string $label = null)
     * @method Show\Field|Collection unit(string $label = null)
     * @method Show\Field|Collection supplier_id(string $label = null)
     * @method Show\Field|Collection pid(string $label = null)
     * @method Show\Field|Collection short_title(string $label = null)
     * @method Show\Field|Collection areacode(string $label = null)
     * @method Show\Field|Collection zipcode(string $label = null)
     * @method Show\Field|Collection pinyin(string $label = null)
     * @method Show\Field|Collection lng(string $label = null)
     * @method Show\Field|Collection lat(string $label = null)
     * @method Show\Field|Collection tree(string $label = null)
     * @method Show\Field|Collection logo(string $label = null)
     * @method Show\Field|Collection banner(string $label = null)
     * @method Show\Field|Collection cert(string $label = null)
     * @method Show\Field|Collection covers(string $label = null)
     * @method Show\Field|Collection contact_way(string $label = null)
     * @method Show\Field|Collection reply(string $label = null)
     * @method Show\Field|Collection from(string $label = null)
     * @method Show\Field|Collection sitehelp_type_id(string $label = null)
     * @method Show\Field|Collection desc(string $label = null)
     * @method Show\Field|Collection linkman_tel(string $label = null)
     * @method Show\Field|Collection linkman_name(string $label = null)
     * @method Show\Field|Collection linkman_address(string $label = null)
     * @method Show\Field|Collection payable_type(string $label = null)
     * @method Show\Field|Collection payable_id(string $label = null)
     * @method Show\Field|Collection wallet_id(string $label = null)
     * @method Show\Field|Collection confirmed(string $label = null)
     * @method Show\Field|Collection meta(string $label = null)
     * @method Show\Field|Collection uuid(string $label = null)
     * @method Show\Field|Collection from_type(string $label = null)
     * @method Show\Field|Collection from_id(string $label = null)
     * @method Show\Field|Collection to_type(string $label = null)
     * @method Show\Field|Collection to_id(string $label = null)
     * @method Show\Field|Collection status_last(string $label = null)
     * @method Show\Field|Collection deposit_id(string $label = null)
     * @method Show\Field|Collection withdraw_id(string $label = null)
     * @method Show\Field|Collection discount(string $label = null)
     * @method Show\Field|Collection is_default(string $label = null)
     * @method Show\Field|Collection view_count(string $label = null)
     * @method Show\Field|Collection notification_logo(string $label = null)
     * @method Show\Field|Collection notification_count(string $label = null)
     * @method Show\Field|Collection email_verified_at(string $label = null)
     * @method Show\Field|Collection weixin_openid(string $label = null)
     * @method Show\Field|Collection weapp_openid(string $label = null)
     * @method Show\Field|Collection weixin_session_key(string $label = null)
     * @method Show\Field|Collection weixin_unionid(string $label = null)
     * @method Show\Field|Collection introduction(string $label = null)
     * @method Show\Field|Collection member_level(string $label = null)
     * @method Show\Field|Collection birthday(string $label = null)
     * @method Show\Field|Collection qq(string $label = null)
     * @method Show\Field|Collection gender(string $label = null)
     * @method Show\Field|Collection scores(string $label = null)
     * @method Show\Field|Collection lock(string $label = null)
     * @method Show\Field|Collection holder_type(string $label = null)
     * @method Show\Field|Collection holder_id(string $label = null)
     * @method Show\Field|Collection balance(string $label = null)
     * @method Show\Field|Collection decimal_places(string $label = null)
     */
    class Show {}

    /**
     
     */
    class Form {}

}

namespace Dcat\Admin\Grid {
    /**
     
     */
    class Column {}

    /**
     
     */
    class Filter {}
}

namespace Dcat\Admin\Show {
    /**
     
     */
    class Field {}
}
