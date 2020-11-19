package com.demo.springbootdemo.config;

import com.demo.springbootdemo.config.intercepors.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * web拦截器配置类
 *
 * @author: guan.kai
 * @date: 2019/8/29 17:31
 **/
@Configuration
public class WebConfigurer implements WebMvcConfigurer {

    /** 登录拦截器 */
    @Autowired
    private LoginInterceptor loginInterceptor;

    /** 放行接口路径 */
    private static final String[] EXCLUDE_PATHS = {
            "/test",
            "/login",
            "/register"
    };

    /** 静态资源路径 */
    private static final String[] STATIC_RESOURCES = {
            "/css/**",
            "/js/**",
            "/images/**",
            "/fonts/**",
            "/bootstrap/**"
    };


    /**
     * 注册拦截器，我们自己写好的拦截器需要通过这里添加注册才能生效
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // addPathPatterns("/**") 表示拦截所有的请求，
        // excludePathPatterns("/login", "/register") 表示除了登陆与注册之外，因为登陆注册不需要登陆也可以访问
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(EXCLUDE_PATHS)
                .excludePathPatterns(STATIC_RESOURCES);
//        super.addInterceptors(registry);    //较新Spring Boot的版本中这里可以直接去掉，否则会报错
    }

    /**
     * 配置静态资源，隐藏资源在服务器中的真实路径
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler(this.url + "**")
//                .addResourceLocations("file:" + this.path);
        //addResourceHandler("/static/**")     访问路径
        //addResourceLocations("classpath:/static/")    资源真实路径
    }
}
