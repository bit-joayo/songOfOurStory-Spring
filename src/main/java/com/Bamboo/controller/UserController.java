package com.Bamboo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Bamboo.service.UserService;
import com.Bamboo.vo.UserVo;



@Controller
public class UserController {

		@Autowired
		private UserService userServiceImpl;
	
		// MARK: 로그인
		@RequestMapping(value = "/user/login", method = RequestMethod.GET)
		public String loginGet() {
			return "/user/login";
		}

		@RequestMapping(value = "/user/login", method = RequestMethod.POST)
		public String loginPost(@RequestParam(value = "userid", required = false) String userid,
				@RequestParam(value = "password", required = false) String password, 
				HttpSession session) {
			if (userid.length() == 0 || password.length() == 0) {
				System.err.println("email, password 없음");
				return "redirect:/user/login";
			}

			UserVo authUser = userServiceImpl.getUser(userid, password);

			// authUser != null -> 사용자가 있다 -> Session에 authUser를 적재
			if (authUser != null) {
				session.setAttribute("authUser", authUser);
				

				return "redirect:/";
			} else {
				return "redirect:/user/login";
			}
		}

		// MARK: 로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			// 로그인 정보 삭제
			session.removeAttribute("authUser");
			// 세션 무효화
			session.invalidate();

			return "redirect:/";
		}
		
		//TODO: 중복이메일체크
		
		// 중복 이메일 체크
			@ResponseBody
			@RequestMapping(value = "/user/join/check", method = RequestMethod.GET)
			public Object exists(@RequestParam(value = "id", required = true, defaultValue = "") String userId) {
				
				System.out.println("hyewon :: aaa");
				
				UserVo vo = userServiceImpl.getUserByUserId(userId);
				Map<String, Object> map = new HashMap<>();
				map.put("result", "success");
				map.put("data", vo != null ? "exists" : "not exists");
				return map;
			}
		
		
		@RequestMapping(value= "/join", method = RequestMethod.GET)
		public String join(@ModelAttribute UserVo vo) {
			return "user/join";
		}
		// MARK: 회원가입
		@RequestMapping(value = "/user/join", method = RequestMethod.POST)
		public String joinAction(@ModelAttribute @Valid UserVo userVo, BindingResult result, Model model) { // @Valid: UserVo에


			boolean success = false;
			try {
//				success = userServiceImpl.join(vo);
				success = userServiceImpl.writeUser(userVo);
				System.out.println("hyewon :: try" + userVo);
			} catch (Exception e) {
				System.out.println("hyewon :: catch");

				e.printStackTrace();
			}

			if (success) {
//				UserVo authUser = userServiceImpl.getUserByUserId(userVo.getUserId());
//				System.out.println("hyewon :: getUserNo" + authUser.getUserNo());
//
//				BlogVo blogVo = new BlogVo(authUser.getUserNo(), authUser.getUserName() + "의 블로그입니다", "");
//				System.err.println("blogVo:" + blogVo);
//				blogServiceImpl.writeBlog(blogVo);

				return "redirect:/user/login";
			} else {
				System.out.println("hyewon :: join no Success");

				return "redirect:/user/login";
			}

		}

		@RequestMapping(value = "/user/joinsuccess")
		public String joinSuccess() {
			return "joinsuccess";
		}
}
