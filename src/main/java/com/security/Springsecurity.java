package com.security;
 
import javax.sql.DataSource;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
 
import com.controller.SuccessHandler;
 
@Configuration
@EnableWebSecurity
@Import({SuccessHandler.class})
public class Springsecurity  extends WebSecurityConfigurerAdapter {
               
                @Autowired
                DataSource dataSource;
                @Autowired
                   SuccessHandler successHandler;
                @Autowired
                public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
                /* auth.inMemoryAuthentication().withUser("username").password("password").roles("USER");
                auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
                */
                auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select username,password, Enable from User where username=?")
                /*.authoritiesByUsernameQuery("select username, role from user_roles where username=?");*/
                .authoritiesByUsernameQuery("select username, role from Authority where username=?");
                }
                @Override
                protected void configure(HttpSecurity http) throws Exception {
 
                http.authorizeRequests()
                .antMatchers("/AdminHome**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/index").access("hasRole('ROLE_USER')")
               
                .and()
                .formLogin().loginPage("/login").successHandler(successHandler).failureUrl("/login?error")
                .usernameParameter("username").passwordParameter("password")
                /*.and()
                .formLogin().defaultSuccessUrl("/success")*/
                .and()
                .logout().logoutUrl("/perform_logout").logoutSuccessUrl("/index?logout")
                .and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
                .csrf().disable();
                }
 
}