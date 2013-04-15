package com.jcteam.picase.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.jcteam.picase.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}
