package com.domain;

public class Message {
    private String nickname;
    private String messages;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getMessages() {
        return messages;
    }

    @Override
    public String toString() {
        return "Message{" +
                "nickname='" + nickname + '\'' +
                ", messages='" + messages + '\'' +
                '}';
    }

    public void setMessages(String messages) {
        this.messages = messages;

    }
}

