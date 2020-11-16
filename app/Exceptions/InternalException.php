<?php

namespace App\Exceptions;
use Exception;
use Throwable;

class InternalException extends Exception
{
    protected $toUserMsg;
   public function __construct($message = "", $code = 0,$toUserMsg='系统错误', Throwable $previous = null)
   {
       parent::__construct($message, $code, $previous);
       $this->toUserMsg=$toUserMsg;
   }
   public function render(){
       if(request()->expectsJson())
       {
           return response()->json(['message'=>$this->toUserMsg],$this->code);
       }
       return view('errors.index',['message'=>$this->toUserMsg]);
   }
}
