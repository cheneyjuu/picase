package com.jcteam.picase.service.admin;

import com.jcteam.picase.entity.Album;
import com.jcteam.picase.repository.AlbumDao;
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
 * Date: 13-4-12
 * Time: 下午11:09
 */
@Component
@Transactional (readOnly = true)
public class AlbumService {

    private AlbumDao albumDao;

    // 新增操作
    @Transactional (readOnly = false)
    public void save(Album album){
        albumDao.save(album);
    }

    // 根据父菜单名查找相册
    public Page<Album> findByParentMenu(final String parentMenu, int pageNumber, int pageSize){
        return albumDao.findAll(new Specification<Album>() {
            @Override
            public Predicate toPredicate(Root<Album> albumRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> parent = albumRoot.get("parentMenu");
                criteriaQuery.where(criteriaBuilder.equal(parent,parentMenu));
                return null;
            }
        }, new PageRequest(pageNumber-1, pageSize));
    }

    public Album findById(Long id){
        return albumDao.findOne(id);
    }

    @Autowired
    public void setAlbumDao(AlbumDao albumDao) {
        this.albumDao = albumDao;
    }
}
