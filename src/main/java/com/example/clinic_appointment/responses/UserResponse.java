package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.Role;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.UserStatus;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class UserResponse {
    private Long id;
    private String username;
    @JsonProperty("img_url")
    private String imgUrl;
    private String email;
    private String name;
    private String address;
    @JsonProperty("phone_number")
    private String phoneNumber;
    @JsonProperty("date_of_birth")
    private LocalDate dateOfBirth;
    private boolean gender;
    private String type;
    private UserStatus status;
    private RoleResponse role;

    public static UserResponse fromUser(User user){
        return UserResponse.builder()
                .id(user.getId())
                .username(user.getUserName())
                .imgUrl(user.getImgUrl())
                .email(user.getEmail())
                .name(user.getName())
                .address(user.getAddress())
                .phoneNumber(user.getPhoneNumber())
                .dateOfBirth(user.getDateOfBirth())
                .gender(user.isGender())
                .type(user.getType())
                .status(user.getStatus())
                .role(RoleResponse.fromRole(user.getRole()))
                .build();
    }
}
