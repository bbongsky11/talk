import React, { useEffect, useState } from "react";
import SockJS from "sockjs-client";
import { Client } from '@stomp/stompjs';
import "./Chat.css";

export default function Chat() {
    const [client, setClient] = useState(null);
    const [input, setInput] = useState("");
    const [name, setName] = useState("익명");
    const [messages, setMessages] = useState([
        {
            id: 1,
            from: "user",
            text:
                "안녕하세요 😊\n메세지를 입력해보세요.\n다른 브라우저에서도 채팅됩니다!"
        }
    ]);

    useEffect(() => {
        const sock = new SockJS("http://localhost:8080/ws");
        const stomp = new Client({
            webSocketFactory: () => sock,
            reconnectDelay: 5000
        });

        stomp.onConnect = () => {
            console.log("CONNECTED!");

            stomp.subscribe("/topic/chat", (message) => {
                console.log("message:", message);
                const body = JSON.parse(message.body);

                setMessages((prev) => [
                    ...prev,
                    {
                        id: Date.now(),
                        from: body.sender === name ? "me" : "user",
                        text: `${body.sender} : ${body.message}`
                    }
                ]);

                console.log("RECEIVED2:", message.body);
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
        console.log("SEND:", name, input);

        setInput("");
    };

    return (
        <div className="chat-wrap">
            <div className="chat-header">채팅</div>

            <div className="chat-body">
                {messages.map((msg) => (
                    <div
                        key={msg.id}
                        className={`message `}
                    >
                        <div className="bubble">{msg.text}</div>
                    </div>
                ))}
            </div>

            <div style={{ padding: "8px", textAlign: "center" }}>
                <input
                    style={{
                        width: "90%",
                        padding: "6px",
                        borderRadius: "8px",
                        border: "1px solid #ddd"
                    }}
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="닉네임 입력"
                />
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
