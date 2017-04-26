package com.graduate.hotel.operator.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.graduate.common.SessionKey;
import com.graduate.util.MD5Util;

@Service("operatorService")
public class OperatorService {
	@Autowired
	private OperatorMapper operatorMapper;
	
	public boolean LoginApply(HttpServletRequest request, String loginName, String password) {
		// 判断用户名是否存在
		Operator operator = operatorMapper.selectByLoginName(loginName, null);
		HttpSession session = request.getSession();
		if (operator != null) {
			// 密码加密后判断与原密码是否一致
			String pass = MD5Util.toMD5(password);
			if (pass.equals(operator.getPassword())) {
				session.setAttribute(SessionKey.USER, operator);
				session.setAttribute("name", operator.getLoginName());
				return true;
			}
			request.setAttribute("message", "用户名或密码输入有误，请重新输入");
			return false;
		}
		request.setAttribute("message", "用户名或密码输入有误，请重新输入");
		return false;
	}
	
	public Operator selectByLoginName(String loginName,String id){
		return operatorMapper.selectByLoginName(loginName, id);
	}
	
	@Transactional
	public void regist(Operator operator,MultipartFile photoFile)throws IllegalStateException, IOException{
		String password = MD5Util.toMD5(operator.getPassword());
		operator.setId(UUID.randomUUID().toString());
		operator.setPassword(password);
		if(",,".equals(operator.getAddress())){
			operator.setAddress(null);
		}
		if("".equals(operator.getBirthDay())){
			operator.setBirthDay(null);
		}
		if (photoFile != null && photoFile.getSize() > 0) {
			String fileName = photoFile.getOriginalFilename();
			String fileSuffix = fileName.substring(fileName.lastIndexOf("."));
			String fileNewName = operator.getId() + fileSuffix;
			String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
			int num = t.indexOf(".metadata");
			String path = t.substring(1, num).replace('/', '\\') + "hotel\\WebContent\\file\\";
			String filePath = path + fileNewName;
			File file = new File(filePath);
			photoFile.transferTo(file);
			operator.setImgUrl(filePath);
		}
		operatorMapper.add(operator);
	}
	
	/**
	 * id查询
	 * @param id
	 * @return
	 */
	public Operator findById(@Param("id")String id){
		return operatorMapper.findById(id);
	}
}
