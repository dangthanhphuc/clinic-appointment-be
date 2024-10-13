package com.example.clinic_appointment.dtos;

import com.example.clinic_appointment.enums.UserType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LoginDTO {
    private String username;
    private String password;
    @JsonProperty("user_type")
    private UserType userType;
}
