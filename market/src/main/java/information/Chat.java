package information;

import java.sql.Timestamp;

public class Chat {
    private int chatId;
    private int itemId;
    private int senderId;
    private int receiverId;
    private String message;
    private Timestamp sentAt;

    // 생성자, getter, setter
    public Chat(int itemId, int senderId, int receiverId, String message) {
        this.itemId = itemId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.message = message;
    }

    public int getChatId() {
        return chatId;
    }

    public void setChatId(int chatId) {
        this.chatId = chatId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getSentAt() {
        return sentAt;
    }

    public void setSentAt(Timestamp sentAt) {
        this.sentAt = sentAt;
    }
}