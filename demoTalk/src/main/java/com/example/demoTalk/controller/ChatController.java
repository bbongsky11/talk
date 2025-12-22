package com.example.talk.controller;

import com.example.talk.dto.ChatMessage;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

    @MessageMapping("/send")
    @SendTo("/topic/chat")
    public ChatMessage send(ChatMessage chatMessage) {
        return chatMessage;
    }
}