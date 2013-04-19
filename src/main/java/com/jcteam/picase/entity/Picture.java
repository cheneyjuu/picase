package com.jcteam.picase.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * User: juchen
 * Date: 13-4-14
 * Time: 下午12:29
 */
@Entity
@Table (name = "tbl_picture")
public class Picture extends IdEntity {

    private Album album;
    private String intro;
    private String imagePath;
    private String originName;
    private String thumbName;
    private String sliderName;
    private Long showIndex;

    public String getSliderName() {
        return sliderName;
    }

    public void setSliderName(String sliderName) {
        this.sliderName = sliderName;
    }

    public String getThumbName() {
        return thumbName;
    }

    public void setThumbName(String thumbName) {
        this.thumbName = thumbName;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    @ManyToOne
    @JoinColumn(name = "album_id")
    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public Long getShowIndex() {
        return showIndex;
    }

    public void setShowIndex(Long showIndex) {
        this.showIndex = showIndex;
    }
}
