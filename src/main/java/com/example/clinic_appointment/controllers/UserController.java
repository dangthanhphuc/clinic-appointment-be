package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.dtos.LoginDTO;

import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.UserType;
import com.example.clinic_appointment.exceptions.LockedException;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;
import com.example.clinic_appointment.responses.LoginResponse;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.responses.UserResponse;
import com.example.clinic_appointment.services.user.IUserService;
import jakarta.validation.constraints.Null;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

import static org.springframework.http.HttpStatus.*;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final IUserService userService;

    @PostMapping("/login")
    public ResponseEntity<ResponseObject> login(@RequestBody LoginDTO loginDTO) throws UsernameNotFoundException, LockedException {
        String token = userService.login(loginDTO);
        User userDetails = userService.getUserDetailsFromToken(token, loginDTO.getUserType());

        LoginResponse loginResponse = LoginResponse.builder()
                .token(token)
                .userId(userDetails.getId())
                .userType(loginDTO.getUserType())
                .build();

        return ResponseEntity.ok().body(
            ResponseObject.builder()
                    .timeStamp(LocalDateTime.now())
                    .message("Login successfully!")
                    .status(OK)
                    .statusCode(OK.value())
                    .data(loginResponse)
                    .build()
        );
    }

    @GetMapping("/details/{userType}")
    public ResponseEntity<ResponseObject> getUserDetails(
            @RequestHeader("Authorization") String authorizationHeader,
            @PathVariable("userType") String userType
    ) throws UsernameNotFoundException {
        String extractedToken = authorizationHeader.substring(7); // Loại bỏ "Bearer " từ chuỗi token
        User user = userService.getUserDetailsFromToken(extractedToken, UserType.valueOf(userType));
        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .message("Get user's detail successfully")
                        .data(UserResponse.fromUser(user))
                        .status(OK)
                        .statusCode(OK.value())
                        .build()
        );
    }

}
