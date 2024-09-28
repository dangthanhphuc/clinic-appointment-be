package com.example.clinic_appointment.filters;

import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.utils.JwtTokenUtils;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.modelmapper.internal.Pair;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.util.Arrays;
import java.util.List;

@Component
@RequiredArgsConstructor
public class JwtTokenFilter extends OncePerRequestFilter {

    private final JwtTokenUtils jwtTokenUtils;
    private final UserDetailsService userDetailsService;

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException
    {

        try {
            // Pass qua những request không cần xác thực và phân quyền
            if(isByPassToken(request)){
              filterChain.doFilter(request, response);
              return;
            }

            // Xác thực
            String authHeader = request.getHeader("Authorization");
            if(authHeader == null || !authHeader.startsWith("Bearer ")){
                response.sendError(
                        HttpServletResponse.SC_UNAUTHORIZED,
                        "Authentication header is null or not starts with 'Bearer' !"
                );
                return;
            }

            String token = authHeader.substring(7);
            String username = jwtTokenUtils.getUsernameFromToken(token);

            if(username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                User userDetails = (User) userDetailsService.loadUserByUsername(username);

                if(jwtTokenUtils.isTokenExpired(token)) {
                    UsernamePasswordAuthenticationToken authenticationToken =
                            new UsernamePasswordAuthenticationToken(
                                    userDetails,
                                    null,
                                    userDetails.getAuthorities()
                            );
                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                }
                filterChain.doFilter(request, response); // enable bypass
            }

        } catch(AccessDeniedException e) {
            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN, "User does not have access :" +e.getMessage()
            );
        } catch (Exception e){
            response.sendError(
                    HttpServletResponse.SC_UNAUTHORIZED
            );
            response.getWriter().write(e.getMessage());
        }

    }


    private boolean isByPassToken(HttpServletRequest request) {

        List<Pair<String, String>> byPassToken =  Arrays.asList(
                Pair.of("**", "GET"),
                Pair.of("**", "POST"),
                Pair.of("**", "PUT"),
                Pair.of("**", "DELETE")
        );

        for(Pair<String, String> pair : byPassToken) {
            String servletPath = pair.getLeft();
            String requestMethod = pair.getRight();

            if(request.getServletPath().matches(servletPath.replace("**", ".*"))
                    && request.getMethod().equalsIgnoreCase(requestMethod)
            ){
                return true;
            }
        }

        return false;
    }



}
