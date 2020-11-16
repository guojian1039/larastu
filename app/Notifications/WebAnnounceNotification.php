<?php

namespace App\Notifications;

use App\Models\Announce;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;

class WebAnnounceNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $announce;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Announce $announce)
    {
       $this->announce=$announce;
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
            'id' => $this->announce->id,
            'title' => $this->announce->title,
            'synopsis' => $this->announce->synopsis,
            'cover' => $this->announce->cover,
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
