package com.jcteam.picase.service.admin;

import com.jcteam.picase.entity.Picture;
import com.jcteam.picase.repository.PictureDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;

/**
 * User: juchen
 * Date: 13-4-14
 * Time: 下午12:35
 */
@Component
@Transactional (readOnly = true)
public class PictureService {

    private PictureDao pictureDao;

    @Autowired
    public void setPictureDao(PictureDao pictureDao) {
        this.pictureDao = pictureDao;
    }

    @Transactional (readOnly = false)
    public void save(Picture picture) {
        pictureDao.save(picture);
    }

    public Page<Picture> findByMenu(final String parentMenu, final String childMenu, int pageNumber, int pageSize) {
        return pictureDao.findAll(new Specification<Picture>() {
            @Override
            public Predicate toPredicate(Root<Picture> pictureRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> pm = pictureRoot.get("album.parentMenu");
                Path<String> cm = pictureRoot.get("album.childMenu");
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize));
    }
}
