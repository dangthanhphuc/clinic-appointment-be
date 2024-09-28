package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.Role;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class RoleResponse {
    private Long id;
    private String name;

    public static RoleResponse fromRole(Role role) {
        return RoleResponse.builder()
                .id(role.getId())
                .name(role.getName())
                .build();
    }
}
