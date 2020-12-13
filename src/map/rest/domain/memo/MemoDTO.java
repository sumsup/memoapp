package map.rest.domain.memo;

import java.util.Date;

public class MemoDTO {
    private long id;
    private int writerId;
    private String memo;
    private String category;
    private Date createdAt;
    private Date updatedAt;

    public void setId(long id) {
        this.id = id;
    }

    public void setWriterId(int writerId) {
        this.writerId = writerId;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public long getId() {
        return id;
    }

    public int getWriterId() {
        return writerId;
    }

    public String getMemo() {
        return memo;
    }

    public String getCategory() {
        return category;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    @Override
    public String toString() {
        return "MemoDTO{" +
                "id=" + id +
                ", writerId=" + writerId +
                ", memo='" + memo + '\'' +
                ", category='" + category + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}