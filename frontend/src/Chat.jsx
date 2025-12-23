import React, { useEffect, useState } from "react";
import SockJS from "sockjs-client";
import { Client } from '@stomp/stompjs';
import "./Chat.css";

export default function Chat() {
    const [client, setClient] = useState(null);
    const [input, setInput] = useState("");
    const [name, setName] = useState(localStorage.getItem("clientId"));
    const [messages, setMessages] = useState([
        {
            id: 1,
            from: "user",
            sender: localStorage.getItem("clientId"),
            text:
                "안녕하세요 😊\n메세지를 입력해보세요.\n다른 브라우저에서도 채팅됩니다!"
        }
    ]);

    useEffect(() => {
        function generateUUID() {
            return crypto.randomUUID();
        }

        let clientId = localStorage.getItem("clientId");

        if (!clientId) {
            clientId = generateUUID();
            localStorage.setItem("clientId", clientId);
            console.log("clientId:",clientId);
        }


        const sock = new SockJS("http://localhost:8080/ws");
        const stomp = new Client({
            webSocketFactory: () => sock,
            reconnectDelay: 5000
        });

        stomp.onConnect = () => {
            console.log("CONNECTED!");

            stomp.subscribe("/topic/chat", (message) => {
                const body = JSON.parse(message.body);

                setMessages((prev) => [
                    ...prev,
                    {
                        id: body.sender,
                        from: body.sender === name ? "me" : "user",
                        text: `${body.message}`
                    }
                ]);
            });
        };

        stomp.activate();
        setClient(stomp);

        return () => stomp.deactivate();
    }, [name]);

    const sendMessage = () => {
        if (!input.trim() || !client) return;

        client.publish({
            destination: "/app/send",
            body: JSON.stringify({
                sender: name,
                message: input
            })
        });

        setInput("");
    };

    return (
        <div className="chat-wrap">
            <div className="chat-header">채팅</div>

            <div className="chat-body">
                {messages.map((msg) => (
                    <div
                        key={msg.id}
                        className={`message ${msg.id === name ? "me" : "user"}`}
                    >
                        <div className="bubble">{msg.text}</div>
                    </div>
                ))}
            </div>

            <div className="chat-input">
                <input
                    value={input}
                    onChange={(e) => setInput(e.target.value)}
                    placeholder="메시지를 입력하세요"
                    onKeyDown={(e) => e.key === "Enter" && sendMessage()}
                />
                <button onClick={sendMessage}>전송</button>
            </div>
        </div>
    );
}
