package org.xllapp.portal.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.main.dao.ConfigDao;
import org.xllapp.portal.main.entity.Config;


@RequestMapping("config")
@Controller
public class ConfigController extends SimpleController<Config>{

	private ConfigDao configDao;

	@Override
	protected CRUDDao<Config> getDao() {
		return this.configDao;
	}

	@Autowired
	public void setConfigDao(ConfigDao configDao) {
		this.configDao = configDao;
	}
	
}
