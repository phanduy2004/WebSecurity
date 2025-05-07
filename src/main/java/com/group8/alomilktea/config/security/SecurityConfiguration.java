package com.group8.alomilktea.config.security;

import com.group8.alomilktea.common.enums.UserRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.io.IOException;

import static org.springframework.security.web.util.matcher.AntPathRequestMatcher.antMatcher;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return new AuthHelper();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(antMatcher("/admin/**")).hasAuthority(UserRole.ADMIN.getRoleName())
                        .requestMatchers(antMatcher("/shipper/**")).hasAuthority(UserRole.SHIPPER.getRoleName())
                        .requestMatchers(
                                antMatcher("/cart/**"),
                                antMatcher("/CheckOut/**"),
                                antMatcher("/web/users/**"),
                                antMatcher("/web/product/add-to-cart/**")
                        ).hasAnyAuthority(UserRole.USER.getRoleName(), UserRole.ADMIN.getRoleName())
                        .requestMatchers(
                                antMatcher("/auth/**"),
                                antMatcher("/api/**"),
                                antMatcher("/**")
                        ).permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin(login -> login
                        .loginPage("/auth/login")
                        .defaultSuccessUrl("/")
                        .failureHandler(customAuthenticationFailureHandler())
                        .permitAll()
                )
                .rememberMe(re -> re
                        .key("uniqueAndSecret")
                        .rememberMeCookieName("tracker-remember-me")
                        .userDetailsService(userDetailsService())
                        .tokenValiditySeconds(5000)
                )
                .logout(logout -> logout
                        .invalidateHttpSession(true)
                        .clearAuthentication(true)
                        .logoutRequestMatcher(new AntPathRequestMatcher("/auth/logout"))
                        .logoutSuccessUrl("/")
                        .deleteCookies("JSESSIONID")
                        .permitAll()
                )
                .exceptionHandling(e -> e.accessDeniedPage("/403"))
                .sessionManagement(session -> session
                        .maximumSessions(1)
                        .expiredUrl("/")
                        .maxSessionsPreventsLogin(true)
                );

        return httpSecurity.build();
    }

    @Bean
    public AuthenticationFailureHandler customAuthenticationFailureHandler() {
        return new AuthenticationFailureHandler() {
            @Override
            public void onAuthenticationFailure(
                    HttpServletRequest request,
                    HttpServletResponse response,
                    AuthenticationException exception
            ) throws IOException, ServletException {
                request.getSession().setAttribute("loginStatus", "failure");
                response.sendRedirect("/auth/login?message=error");
            }
        };
    }
}
