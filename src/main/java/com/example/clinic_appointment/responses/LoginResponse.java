package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.enums.UserType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@Builder
public class LoginResponse {
    private String token;

    @JsonProperty("user_id")
    private Long userId;

    private UserType userType;

    private List<String> roles;
}
