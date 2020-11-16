<?php

namespace App\Notifications;

use App\Models\CouponType;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;

class CouponNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $couponType;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(CouponType $couponType)
    {
       $this->couponType=$couponType;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toDatabase($notifiable)
    {
        // 存入数据库里的数据
        return [
            'id' => $this->couponType->id,
            'title' => $this->couponType->title,
            'get_start_time' => $this->couponType->get_start_time,
            'get_end_time' => $this->couponType->get_end_time,
        ];
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
