package org.fkjava.shopping.action;

import com.google.gson.Gson;
import org.fkjava.shopping.domain.Article;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.page.IndexData;
import org.fkjava.shopping.servlet.impl.IndexServlet;
import org.fkjava.shopping.util.GetBeanUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class ArticleAction {

    @RequestMapping("/login")
    public String login(Integer shopNumb,HttpServletRequest request, HttpServletResponse response,Model model){
        //获取响应中的CONTEXTPATH参数，如果有，说明该请求非异步请求过来的。
        String contextpath = response.getHeader("CONTEXTPATH");

        if(contextpath==null || "".equals(contextpath)){
            //没有则说明该请求来自于异步请求登录的
            //此时需要从请求中的REFERER中获取其来自于哪个页面，并同步到login页面中，当用户完成登录操作后，可以直接跳转回登录前所正在操作的页面
            String referer = request.getHeader("REFERER");
//            contains：判断字符串中是否包含指定的字符
            if(referer.contains("/car/detail")) {
                //判断该url是否为商品详情页的url
                model.addAttribute("contextUrl", referer + "&shopNumb=" + shopNumb);
            }else{
                model.addAttribute("contextUrl",referer);
            }
            return "login";
        }else{
            //如果有,说明非来自异步，此时只需获取CONTEXTPATH,该参数是在springMVC拦截器中设置的。
            model.addAttribute("contextUrl",contextpath);
            return "login";
        }


    }

    @RequestMapping(value = "/loginVerification",method = RequestMethod.POST)
    public String index(String contextUrl,String userName, String password, Model model, HttpSession session){
        System.out.println("获取登录前用户所在页面"+contextUrl);
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
        String s = indexServlet.loginServlet(userName, password, session);
        System.out.println(s);
        if ("success".equals(s)){ ;
            return "redirect:"+contextUrl;
        }else{
            model.addAttribute("mags",s);
            model.addAttribute("userName",userName);
            return "forward:/user/login";
        }
    }

    //展示用户注册页面
    @RequestMapping("/registration")
    public String registrationPage(){
        return "register";
    }

    @RequestMapping("/usernameVerification")
    @ResponseBody
    public String usernameVerification(String username){
        System.out.println("userName:"+username);
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
        String b = indexServlet.verificationLoginName(username);
        Map<String,String> map = new HashMap<String, String>();
        Gson gson = new Gson();
        map.put("valid",b);
        String json = gson.toJson(map);
        return json;
    }


    //注册

    @RequestMapping("/userRegister")
    public String userRegister(User user){
        System.out.println(user.getName());
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
        String s = indexServlet.userRegister(user);
        if ("success".equals(s)){
            return "redirect:/user/index";
        }else{
            throw new RuntimeException();
        }

    }

    /*
    * 设计成：当用户提交的用户名密码通过后台验证后。
    * 返回的是状态码，而不是跳转到写死的页面
    * 将登陆动作和登陆验证写在一个action方法中，这样方便控制后天的跳转。
    *
    * */
    @RequestMapping("/index")
    public String forIndex(String parameterIndex, Integer page, Model model){
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
        IndexData indexData = indexServlet.indexData(parameterIndex,page);
        model.addAttribute("IndexData",indexData);
        if (parameterIndex!=null) {
            System.out.println("parameterIndex" + parameterIndex.equals(""));
        }
        model.addAttribute("ParameterIndex",parameterIndex);
//        model.addAttribute("pageNumb",pageNumb);
        System.out.println(page);
        model.addAttribute("pageNumb",indexData.getPageNumb());
        return "index";
    }

    @RequestMapping("/detail")
    public String detailData(Integer id,Integer shopNumb,Model model){
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
        Article detail = indexServlet.getDetail(id);
        model.addAttribute("detailData",detail);
        model.addAttribute("shopNumb",shopNumb);
        return "detial";
    }


    //邮箱验证
    @RequestMapping("/email")
    public String email(String id,HttpSession session){
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
        String s = indexServlet.emailRegister(id,session);
        if ("success".equals(s)){
            return "gotohtml";
        }else{
            throw new RuntimeException();
        }
    }

}
