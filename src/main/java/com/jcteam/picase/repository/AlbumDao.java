package com.jcteam.picase.repository;

import com.jcteam.picase.entity.Album;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * 相册
 * User: juchen
 * Date: 13-4-12
 * Time: 下午11:05
 */
public interface AlbumDao extends PagingAndSortingRepository<Album, Long>, JpaSpecificationExecutor<Album> {
}
