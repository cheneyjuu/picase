package com.jcteam.picase.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: juchen
 * Date: 13-4-12
 * Time: 下午10:58
 * 相册类
 */
@Entity
@Table (name = "tbl_album")
public class Album extends IdEntity{

    @NotBlank
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @NotBlank
    public String getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(String parentMenu) {
        this.parentMenu = parentMenu;
    }

    public String getChildMenu() {
        return childMenu;
    }

    public void setChildMenu(String childMenu) {
        this.childMenu = childMenu;
    }

    private String title;//相册名称
    private String parentMenu;//所属一级菜单
    private String childMenu;//所属二级菜单，可以为空
}
