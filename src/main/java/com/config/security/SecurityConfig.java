package com.config.security;

import com.config.handler.FailureAuthenticationHandler;
import com.config.handler.SuccessAuthenticationHandler;
import com.service.detailsService.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@ComponentScan("com")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;
    @Autowired
    private SuccessAuthenticationHandler successAuthenticationHandler;
    @Autowired
    private FailureAuthenticationHandler failureAuthenticationHandler;

    @Override
    public void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.authorizeRequests()
                .anyRequest().authenticated()
                .antMatchers("/resources/**", "/","/login").permitAll()
                .antMatchers("/user").hasRole("USER")
                .antMatchers("/admin/*").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin().permitAll()
                    .successHandler(successAuthenticationHandler)
                    .failureHandler(failureAuthenticationHandler)
                .and()
                .logout().permitAll();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(getNoOpPasswordEncoder());
    }

    public PasswordEncoder getNoOpPasswordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }
}