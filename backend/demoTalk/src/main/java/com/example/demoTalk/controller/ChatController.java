package com.example.demoTalk.controller;

import com.example.demoTalk.dto.ChatMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
@Slf4j
public class ChatController {

    private final SimpMessagingTemplate simpMessagingTemplate;

    @MessageMapping("/send/{name}")
    public void send(
            @DestinationVariable String name,
            ChatMessage message
    ) {
        log.info("roomId: {}, message: {}", name, message);

        simpMessagingTemplate.convertAndSend(
                "/exchange/chat.exchange/chat." + name,
                message
        );
    }


}