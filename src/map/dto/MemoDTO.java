package map.dto;

public class MemoDTO {
    public long id;
    public String email;
    public String password;
    public String nickname;
    public String sex;
    public String birthday;

    public void setId(long id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getNickname() {
        return nickname;
    }

    public String getSex() {
        return sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public String toString() {
        return "MemoDTO [id = " + id + ", email = " + email + ", password = " + password + 
        ", nickname = " + nickname + ", sex = " + sex + ", birthday = " + birthday + "]";
    }

}