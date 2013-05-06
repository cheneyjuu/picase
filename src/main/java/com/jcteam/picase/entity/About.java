package com.jcteam.picase.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: chen
 * Date: 13-1-18
 * Time: 下午3:05
 */
@Entity
@Table(name = "tbl_about")
public class About extends IdEntity {

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private String content;
}
