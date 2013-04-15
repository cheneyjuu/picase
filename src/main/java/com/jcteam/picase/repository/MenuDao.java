package com.jcteam.picase.repository;

import com.jcteam.picase.entity.Menu;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

/**
 * User: juchen
 * Date: 13-4-13
 * Time: 下午2:37
 */
public interface MenuDao extends JpaSpecificationExecutor<Menu>, CrudRepository <Menu, Long> {
}
