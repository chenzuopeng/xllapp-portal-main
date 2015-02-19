package org.xllapp.portal.main.entity;

import com.ffcs.icity.mvc.entity.IdEntity;
import java.util.Date;

public class Config extends IdEntity {
	
	private static final long serialVersionUID = 1215371916238256916L;

	private String configGroup;
    
    private String configKey;
    
    private String configValue;
    
    private String remark;
    
    private Date createTime;
    
    private Date lastModifTime;
    

    public String getConfigGroup() {
        return this.configGroup;
    }

    public void setConfigGroup(String configGroup) {
        this.configGroup = configGroup;
    }
    public String getConfigKey() {
        return this.configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }
    public String getConfigValue() {
        return this.configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }
    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public Date getLastModifTime() {
        return this.lastModifTime;
    }

    public void setLastModifTime(Date lastModifTime) {
        this.lastModifTime = lastModifTime;
    }

}