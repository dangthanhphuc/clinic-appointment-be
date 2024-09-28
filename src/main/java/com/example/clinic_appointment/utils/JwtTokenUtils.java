package com.example.clinic_appointment.utils;

import com.example.clinic_appointment.entities.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Encoders;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Component
public class JwtTokenUtils {

    @Value("${jwt.secret-key}")
    private String secretKey;

    @Value("${jwt.expiration}")
    private int expiration;

    public SecretKey getSignInKey() {
        byte[] secretKeyBytes = secretKey.getBytes();

        String secretKeyEncode = Encoders.BASE64.encode(secretKeyBytes);

        byte[] secretKeyDecode = Decoders.BASE64.decode(secretKeyEncode);

        return Keys.hmacShaKeyFor(secretKeyDecode);
    }

    public String generateToken(User user) {
        Map<String, String> claims = new HashMap<>();
        claims.put("username", user.getUsername());
        claims.put("role", user.getRole().getName());

        return Jwts.builder()
                .claims(claims)
                .subject(user.getUserName())
                .issuer("https://localhost:8088")
                .issuedAt(new Date(System.currentTimeMillis()))
                .expiration(new Date(System.currentTimeMillis() + expiration * 1000L))
                .signWith(getSignInKey())
                .compact();
    }

    private Claims getAllClaimsFromToken(String token) {
        return Jwts.parser()
                .verifyWith(getSignInKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    private <T> T extractClaimFromToken(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = getAllClaimsFromToken(token);
        return claimsResolver.apply(claims);
    }

    public boolean isTokenExpired(String token) {
        return extractClaimFromToken(token, Claims::getExpiration).before(new Date());
    }

    public String getUsernameFromToken (String token) {
        return extractClaimFromToken(token, Claims::getSubject);
    }


}
