<?php

namespace App\Exceptions;

use Exception;
use Throwable;

class InvalidRequestException extends Exception
{
    public function __construct($message = "", $code = 422, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }
    public function render()
    {

        if(request()->expectsJson())
        {
            return response()->json(['message'=>$this->message],$this->code);
        }
        return view('errors.index',['message'=>$this->message]);
    }
}
