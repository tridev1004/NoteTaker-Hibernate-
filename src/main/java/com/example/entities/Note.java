package com.example.entities;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;
import java.util.Random;

@Entity
public class Note {

    @Id
    private int id;

    public Note(String title, String content, Date addeddate) {
        this.id = new Random().nextInt(100000);
        this.title = title;
        this.content = content;
        this.addeddate = addeddate;
    }

    private String title;

    public Note() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddeddate() {
        return addeddate;
    }

    public void setAddeddate(Date addeddate) {
        this.addeddate = addeddate;
    }


    @Column(length = 1500)
    private String content;
    private Date addeddate;

}
