package com.jcteam.picase.service.admin;

import com.jcteam.picase.entity.About;
import com.jcteam.picase.repository.AboutDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: chen
 * Date: 13-1-18
 * Time: 下午3:07
 */
@Component
@Transactional(readOnly = true)
public class AboutService {

    @Autowired
    private AboutDao aboutDao;

    @Transactional (readOnly = false)
    public void addAbout(About about){
        aboutDao.save(about);
    }

    public About findAbout(){
        return ((List<About>)aboutDao.findAll()).size()>0?((List<About>)aboutDao.findAll()).get(0):null;
    }

    public Page<About> findOnlyOne(){
        PageRequest pageRequest = new PageRequest(0,1, new Sort(Sort.Direction.DESC,"id"));
        return aboutDao.findAll(pageRequest);
    }
}
