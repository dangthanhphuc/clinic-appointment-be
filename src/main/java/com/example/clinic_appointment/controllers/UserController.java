package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.dtos.CreateUserDTO;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.services.user.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final IUserService userService;

    @PostMapping()
    public ResponseEntity<ResponseObject> addUser(@RequestBody  CreateUserDTO createUserDTO) {
        User user = userService.add(createUserDTO);
        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .data(user)
                        .build()
        );
    }

}
