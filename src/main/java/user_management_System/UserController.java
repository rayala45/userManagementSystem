package user_management_System;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Autowired
	public static EntityManager em=Persistence.createEntityManagerFactory("dev").createEntityManager();
	
	@RequestMapping("/userRegister")
	public ModelAndView userRegister() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("register.jsp");
		return mv;
	}
	
	@RequestMapping("/registeruser")
	public ModelAndView saveUser(@RequestParam String name,
			@RequestParam String email,
			@RequestParam long phone,
			@RequestParam String password
			) {
		ModelAndView mv=new ModelAndView();
		
		User u = new User(0, name, email, phone, password);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(u);
		et.commit();
		mv.addObject("msg", "user registered successfully");
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping("/updateuser")
	public ModelAndView updateuser() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("update.jsp");
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateUser(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		Query q = em.createQuery("select u from User u where u.id=:id");
		q.setParameter("id", id);
		List<User> rl = q.getResultList();
		for(User u:rl) {
			if(u.getId()==id) {
				mv.addObject("u", u);
				mv.setViewName("updatePage.jsp");
				return mv;
			}
		}
		mv.addObject("msg", "something went wrong");
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping("/updateDetails")
	public ModelAndView updateDetails(@RequestParam int id,
			@RequestParam String name,
			@RequestParam String email,
			@RequestParam long phone,
			@RequestParam String password
			
			) {
		ModelAndView mv=new ModelAndView();
		User u = em.find(User.class, id);
		User ul=new User(id, name, email, phone, password);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(ul);
		et.commit();
		mv.addObject("msg", "updated success");
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping("/viewUser")
	public ModelAndView viewUser() {
		ModelAndView mv=new ModelAndView();
		Query q = em.createQuery("from User");
		List<User> ul = q.getResultList();
		mv.addObject("ul", ul);
		mv.setViewName("viewUser.jsp");
		return mv;
	}
	
	@RequestMapping("/deleteuser")
	public ModelAndView deleteuser(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		User u = em.find(User.class, id);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.remove(u);
		et.commit();
		mv.addObject("msg", "user deleted successfully..");
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping("/searchUser")
	public ModelAndView searchUser(@RequestParam String search) {
		
		ModelAndView mv=new ModelAndView();
		Query q = em.createQuery("from User");
		List<User> rl = q.getResultList();
		for(User u:rl) {
			if(u.getEmail().equalsIgnoreCase(search) || u.getName().equalsIgnoreCase(search)) {
				mv.addObject("u", u);
				mv.setViewName("viewoneuser.jsp");
				return mv;
			}
		}
		mv.addObject("msg", "no user details found");
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam String email,@RequestParam String password) {
		ModelAndView mv=new ModelAndView();
		Query q = em.createQuery("from User");
		List<User> rl = q.getResultList();
		for(User u:rl) {
			if(u.getEmail().equalsIgnoreCase(email) && u.getPassword().equalsIgnoreCase(password)) {
				mv.addObject("msg", "login Successful..");
				mv.setViewName("index.jsp");
				return mv;
			}
		}
		mv.addObject("msg", "no user details found");
		mv.setViewName("login.jsp");
		return mv;
	}
	

}
