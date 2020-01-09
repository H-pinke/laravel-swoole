<?php
namespace App\Api\Services;

class MessageService {

    public function getMessage(int $request_id) {
        return $request_id;
    }
}
