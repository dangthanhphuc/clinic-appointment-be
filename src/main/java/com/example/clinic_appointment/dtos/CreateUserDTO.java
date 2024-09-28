package com.example.clinic_appointment.dtos;

import com.example.clinic_appointment.enums.UserType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class CreateUserDTO {
    private String name;
    @JsonProperty("date_of_birth")
    private LocalDate dateOfBirth;
    private boolean gender;
    private String username;
    private String password;
    private UserType type;
}
