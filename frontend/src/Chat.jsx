import React, { useEffect, useState } from "react";
import SockJS from "sockjs-client";
import { Client } from "@stomp/stompjs";


export default function Chat() {
    const [stomp, setStomp] = useState(null);
    const [name, setName] = useState("");
    const [msg, setMsg] = useState("");
    const [chat, setChat] = useState([]);

    useEffect(() => {
        const socket = new SockJS("http://localhost:8080/ws");

        const client = new Client({
            webSocketFactory: () => socket,
            reconnectDelay: 5000
        });

        client.onConnect = () => {
            client.subscribe("/topic/chat", (message) => {
                const body = JSON.parse(message.body);
                setChat(prev => [...prev, body]);
            });
        };

        client.activate();
        setStomp(client);
    }, []);

    const send = () => {
        stomp.send(
            "/app/send",
            {},
            JSON.stringify({
                sender: name,
                message: msg
            })
        );
        setMsg("");
    };

    return (
        <div>
            <h2>Chat</h2>
            <input value={name} onChange={(e)=>setName(e.target.value)} placeholder="name"/><br/>
            <input value={msg} onChange={(e)=>setMsg(e.target.value)} placeholder="message"/>
            <button onClick={send}>Send</button>

            <ul>
                {chat.map((c, i)=>(
                    <li key={i}>{c.sender} : {c.message}</li>
                ))}
            </ul>
        </div>
    );
}
