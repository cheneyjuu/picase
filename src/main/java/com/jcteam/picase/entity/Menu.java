package com.jcteam.picase.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: juchen
 * Date: 13-4-13
 * Time: 下午2:35
 */
@Entity
@Table (name = "tbl_menu")
public class Menu extends IdEntity {

    private String menuName;
    private String parentMenu;

    public String getParentMenu() {
        return parentMenu;
    }

    public void setParentMenu(String parentMenu) {
        this.parentMenu = parentMenu;
    }

    @NotBlank
    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }
}
