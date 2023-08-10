package com.lib.dao;

import com.lib.dto.Admin;
import com.lib.dto.Validate_AdminLogin;

public interface AdminDAO {
	String save(Admin admin);
	int adminValidate(Validate_AdminLogin validateAdminLogin);
	String deleteById(int aid);
	String findById(int aid);

}
