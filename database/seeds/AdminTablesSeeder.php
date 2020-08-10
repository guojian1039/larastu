<?php

use Illuminate\Database\Seeder;

class AdminTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // base tables
        Dcat\Admin\Models\Menu::truncate();
        Dcat\Admin\Models\Menu::insert(
            [
                [
                    "id" => 1,
                    "parent_id" => 0,
                    "order" => 1,
                    "title" => "Index",
                    "icon" => "feather icon-bar-chart-2",
                    "uri" => "/",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ],
                [
                    "id" => 2,
                    "parent_id" => 0,
                    "order" => 14,
                    "title" => "Admin",
                    "icon" => "feather icon-settings",
                    "uri" => "",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 3,
                    "parent_id" => 2,
                    "order" => 15,
                    "title" => "Users",
                    "icon" => "",
                    "uri" => "auth/users",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 4,
                    "parent_id" => 2,
                    "order" => 16,
                    "title" => "Roles",
                    "icon" => "",
                    "uri" => "auth/roles",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 5,
                    "parent_id" => 2,
                    "order" => 17,
                    "title" => "Permission",
                    "icon" => "",
                    "uri" => "auth/permissions",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 6,
                    "parent_id" => 2,
                    "order" => 18,
                    "title" => "Menu",
                    "icon" => "",
                    "uri" => "auth/menu",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 7,
                    "parent_id" => 2,
                    "order" => 19,
                    "title" => "Operation log",
                    "icon" => "",
                    "uri" => "auth/logs",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 8,
                    "parent_id" => 0,
                    "order" => 2,
                    "title" => "用户管理",
                    "icon" => "fa-user",
                    "uri" => "/users",
                    "created_at" => "2020-08-03 10:05:08",
                    "updated_at" => "2020-08-03 10:05:23"
                ],
                [
                    "id" => 9,
                    "parent_id" => 0,
                    "order" => 3,
                    "title" => "分类管理",
                    "icon" => "fa-bars",
                    "uri" => "/categories",
                    "created_at" => "2020-08-04 10:18:43",
                    "updated_at" => "2020-08-04 10:18:52"
                ],
                [
                    "id" => 10,
                    "parent_id" => 0,
                    "order" => 11,
                    "title" => "广告管理",
                    "icon" => "fa-archive",
                    "uri" => "/ads",
                    "created_at" => "2020-08-04 16:00:05",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 11,
                    "parent_id" => 0,
                    "order" => 12,
                    "title" => "品牌管理",
                    "icon" => "fa-500px",
                    "uri" => "/brands",
                    "created_at" => "2020-08-04 16:56:09",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 12,
                    "parent_id" => 0,
                    "order" => 4,
                    "title" => "商品管理",
                    "icon" => "fa-cubes",
                    "uri" => NULL,
                    "created_at" => "2020-08-04 17:10:56",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 13,
                    "parent_id" => 12,
                    "order" => 5,
                    "title" => "普通商品",
                    "icon" => "fa-cubes",
                    "uri" => "/products",
                    "created_at" => "2020-08-04 17:11:17",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 14,
                    "parent_id" => 12,
                    "order" => 6,
                    "title" => "众筹商品",
                    "icon" => "fa-flag-checkered",
                    "uri" => "/crowdfunding_products",
                    "created_at" => "2020-08-05 17:18:07",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 15,
                    "parent_id" => 12,
                    "order" => 7,
                    "title" => "秒杀商品",
                    "icon" => "fa-bolt",
                    "uri" => "/seckill_products",
                    "created_at" => "2020-08-05 17:32:09",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 16,
                    "parent_id" => 12,
                    "order" => 8,
                    "title" => "活动商品",
                    "icon" => "fa-camera-retro",
                    "uri" => "/active_products",
                    "created_at" => "2020-08-06 12:53:42",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 17,
                    "parent_id" => 12,
                    "order" => 9,
                    "title" => "折扣商品",
                    "icon" => "fa-shield",
                    "uri" => "/discount_products",
                    "created_at" => "2020-08-06 13:14:07",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 18,
                    "parent_id" => 0,
                    "order" => 13,
                    "title" => "优惠券",
                    "icon" => "fa-tags",
                    "uri" => "/coupon_codes",
                    "created_at" => "2020-08-10 14:36:25",
                    "updated_at" => "2020-08-10 15:05:33"
                ],
                [
                    "id" => 19,
                    "parent_id" => 0,
                    "order" => 10,
                    "title" => "订单管理",
                    "icon" => "fa-rmb",
                    "uri" => "/orders",
                    "created_at" => "2020-08-10 15:04:59",
                    "updated_at" => "2020-08-10 15:05:33"
                ]
            ]
        );

        Dcat\Admin\Models\Permission::truncate();
        Dcat\Admin\Models\Permission::insert(
            [
                [
                    "id" => 1,
                    "name" => "Auth management",
                    "slug" => "auth-management",
                    "http_method" => "",
                    "http_path" => "",
                    "order" => 1,
                    "parent_id" => 0,
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ],
                [
                    "id" => 2,
                    "name" => "Users",
                    "slug" => "users",
                    "http_method" => "",
                    "http_path" => "/auth/users*",
                    "order" => 2,
                    "parent_id" => 1,
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ],
                [
                    "id" => 3,
                    "name" => "Roles",
                    "slug" => "roles",
                    "http_method" => "",
                    "http_path" => "/auth/roles*",
                    "order" => 3,
                    "parent_id" => 1,
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ],
                [
                    "id" => 4,
                    "name" => "Permissions",
                    "slug" => "permissions",
                    "http_method" => "",
                    "http_path" => "/auth/permissions*",
                    "order" => 4,
                    "parent_id" => 1,
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ],
                [
                    "id" => 5,
                    "name" => "Menu",
                    "slug" => "menu",
                    "http_method" => "",
                    "http_path" => "/auth/menu*",
                    "order" => 5,
                    "parent_id" => 1,
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ],
                [
                    "id" => 6,
                    "name" => "Operation log",
                    "slug" => "operation-log",
                    "http_method" => "",
                    "http_path" => "/auth/logs*",
                    "order" => 6,
                    "parent_id" => 1,
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => NULL
                ]
            ]
        );

        Dcat\Admin\Models\Role::truncate();
        Dcat\Admin\Models\Role::insert(
            [
                [
                    "id" => 1,
                    "name" => "Administrator",
                    "slug" => "administrator",
                    "created_at" => "2020-07-29 02:27:24",
                    "updated_at" => "2020-07-29 02:27:24"
                ]
            ]
        );

        // pivot tables
        DB::table('admin_role_menu')->truncate();
        DB::table('admin_role_menu')->insert(
            [

            ]
        );

        DB::table('admin_role_permissions')->truncate();
        DB::table('admin_role_permissions')->insert(
            [

            ]
        );

        // finish
    }
}
