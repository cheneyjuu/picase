package com.jcteam.picase.service.admin;

import com.jcteam.picase.entity.Album;
import com.jcteam.picase.entity.Picture;
import com.jcteam.picase.repository.PictureDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;

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

    public Page<Picture> findByMenu(final String parentMenu, final String childMenu, final Long albumId, int pageNumber, int pageSize) {
        return pictureDao.findAll(new Specification<Picture>() {
            @Override
            public Predicate toPredicate(Root<Picture> pictureRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> pm = pictureRoot.get("album").get("parentMenu");
                Path<String> cm = pictureRoot.get("album").get("childMenu");
                Path<Long>  aid = pictureRoot.get("album").get("id");
                if (childMenu == null) {
                    criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.equal(pm, parentMenu),criteriaBuilder.equal(aid, albumId)));
                } else {
                    criteriaQuery.where(criteriaBuilder.and(criteriaBuilder.equal(pm, parentMenu),
                            criteriaBuilder.equal(cm, childMenu)),
                            criteriaBuilder.equal(aid, albumId));
                }
                return null;
            }
        }, new PageRequest(pageNumber - 1, pageSize));
    }

    public Picture findById(final Long pictureId){
        return pictureDao.findOne(pictureId);
    }

    public List<Picture> findByAlbumId(final Long albumId) {
        return pictureDao.findAll(new Specification<Picture>() {
            @Override
            public Predicate toPredicate(Root<Picture> pictureRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> aid = pictureRoot.get("album").get("id");
                criteriaQuery.where(criteriaBuilder.equal(aid, albumId));
                return null;
            }
        });
    }

    public List<Picture> findIndexPictureById(){
        return pictureDao.findAll(new Specification<Picture>() {
            @Override
            public Predicate toPredicate(Root<Picture> pictureRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<Long> picId = pictureRoot.get("showIndex");
                criteriaQuery.where(criteriaBuilder.equal(picId, new Long(1)));
                return null;
            }
        });
    }

    @Transactional (readOnly = false)
    public void delete(final Long id) {
        pictureDao.delete(id);
    }
}
