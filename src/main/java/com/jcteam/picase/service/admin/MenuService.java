package com.jcteam.picase.service.admin;

import com.jcteam.picase.entity.Menu;
import com.jcteam.picase.repository.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;

/**
 * User: juchen
 * Date: 13-4-13
 * Time: 下午2:38
 */
@Component
@Transactional(readOnly = true)
public class MenuService {

    private MenuDao menuDao;

    /**
     * 这个方法是查找Menu表中所有的一级菜单。
     * 根据规则，一级菜单的parentMenu为'0'
     * @return
     */
    public List<Menu> findParentMenu() {
        return menuDao.findAll(new Specification<Menu>() {
            @Override
            public Predicate toPredicate(Root<Menu> menuRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> parentId = menuRoot.get("parentMenu");
                criteriaQuery.where(criteriaBuilder.equal(parentId, "0"));
                return null;
            }
        });
    }

    /**
     * 查找二级菜单
     * @param parentMenuParam
     * @return
     */
    public List<Menu> findChildMenu(final String parentMenuParam) {
        return menuDao.findAll(new Specification<Menu>() {
            @Override
            public Predicate toPredicate(Root<Menu> menuRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path<String> parentMenu = menuRoot.get("parentMenu");
                criteriaQuery.where(criteriaBuilder.equal(parentMenu,parentMenuParam));
                return null;
            }
        });
    }

    @Autowired
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
}
