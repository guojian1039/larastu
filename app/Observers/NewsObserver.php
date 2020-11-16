<?php

namespace App\Observers;
use App\Jobs\TranslateSlug;
use App\Models\News;

class NewsObserver
{
    public function saving(News $news)
    {
        // XSS 过滤
        $news->body = clean($news->body, 'news_body');

        // 生成话题摘录
        $news->excerpt = make_excerpt($news->body);
    }

    public function saved(News $news)
    {
        // 如 slug 字段无内容，即使用翻译器对 title 进行翻译
        if ( ! $news->slug) {

            // 推送任务到队列
            dispatch(new TranslateSlug($news));
        }
    }

    public function deleted(News $news)
    {
        \DB::table('news_comments')->where('news_id', $news->id)->delete();
    }
}
