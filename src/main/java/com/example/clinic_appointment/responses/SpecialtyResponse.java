package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.Specialty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class SpecialtyResponse {

    private Long id;

    private String name;

    public static SpecialtyResponse fromSpecialty(Specialty specialty) {
        return SpecialtyResponse.builder()
                .id(specialty.getId())
                .name(specialty.getName())
                .build();
    }

}
