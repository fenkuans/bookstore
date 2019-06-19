package org.fkjava.shopping.interceptor;

import org.fkjava.shopping.domain.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class ShopInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("utf8");
        System.out.println("进入拦截器");
        User user =(User) session.getAttribute("LOGIN_SESSION_IN");
        String xmlHttpRequest = request.getHeader("x-requested-with");
        String uri = request.getServletPath();

        if(!uri.contains("/login")){
            request.getSession().setAttribute("urI",uri);
        }
        if (user==null && !uri.contains("/user/")){
            System.out.println("============拦截===============");
            System.out.println(request.getRequestURL());
            if ("XMLHttpRequest".equals(xmlHttpRequest)) {
                //这句代码用于前台验证来否是来自于拦截器，如果来自拦截器返回的内容则前台的ajax需要走回调函数并处理。
                //如果没有该标识，则前台的回调函数则不会跳转。
                response.setHeader("ResponseVerify","TIMEOUT");
                //设置回调函数中需要跳转到的页面
                response.setHeader("ReturnUrl",request.getContextPath() + "/user/login?shopNumb="+request.getParameter("shopnumb"));
                //SC_FORBIDDEN：表示403，服务求接收并理解用户请求，但是服务器不予与处理（资源不可用）
                response.setStatus(response.SC_FORBIDDEN);
                return false;
            }else{
                String requestURL = request.getRequestURL().toString();
                response.setHeader("CONTEXTPATH",requestURL);
                request.getRequestDispatcher("/user/login").forward(request,response);
                return false;
            }
        }else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
