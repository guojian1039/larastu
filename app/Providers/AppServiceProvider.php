<?php

namespace App\Providers;
use App\Models\Announce;
use App\Models\CouponType;
use App\Models\News;
use App\Observers\AnnounceObserver;
use App\Observers\CouponObserver;
use App\Observers\NewsObserver;
use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Resources\Json\JsonResource;
use Monolog\Logger;
use Yansongda\Pay\Pay;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        /*
        if ($this->app->environment() !== 'production') {
            $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
        }
        */
        // 往服务容器中注入一个名为 alipay 的单例对象
        $this->app->singleton('alipay',function (){
            $config=config('pay.alipay');
            // 判断当前项目运行环境是否为线上环境
                //if (app()->environment() !== 'production') {
                    $config['mode']         = 'dev';
                    $config['log']['level'] = Logger::DEBUG;
           // }
            //else{
           //     $config['log']['level'] = Logger::WARNING;
           // }
            $config['notify_url'] =route('payment.alipay.notify');
            $config['return_url'] = route('payment.alipay.return');
            // 调用 Yansongda\Pay 来创建一个支付宝支付对象

           return Pay::alipay($config);
        });
        $this->app->singleton('wechat_pay',function (){
            $config=config('pay.wechat');
            if (app()->environment() !== 'production') {
                $config['log']['level']=Logger::DEBUG;
            }
            else{
                $config['log']['level']=Logger::WARNING;
            }
            $config['notify_url'] = route('payment.wechat.notify');
            // 调用 Yansongda\Pay 来创建一个微信支付对象
            return Pay::wechat($config);
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        \Schema::defaultStringLength(191);
        \View::composer(['layouts._header'], \App\Http\ViewComposers\CategoryTreeComposer::class);
        JsonResource::withoutWrapping();
        Announce::observe(AnnounceObserver::class);
        CouponType::observe(CouponObserver::class);
        News::observe(NewsObserver::class);
    }
}
