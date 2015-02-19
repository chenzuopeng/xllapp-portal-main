package org.xllapp.portal.main.dao;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

import org.xllapp.portal.main.entity.Config;

@MyBatisRepository
public interface ConfigDao extends CRUDDao<Config> {
	
}