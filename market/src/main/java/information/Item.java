package information;


public class Item {
    private int itemId;
    private int userId;
    private String title;
    private String description;
    private int price;

    // 생성자, getter, setter
    public Item(int itemId, int userId, String title, String description, int price) {
        this.itemId = itemId;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}