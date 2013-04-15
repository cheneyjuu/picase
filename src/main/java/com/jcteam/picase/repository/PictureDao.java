package com.jcteam.picase.repository;

import com.jcteam.picase.entity.Picture;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * User: juchen
 * Date: 13-4-14
 * Time: 下午12:34
 */
public interface PictureDao extends PagingAndSortingRepository<Picture, Long>, JpaSpecificationExecutor<Picture> {

}
