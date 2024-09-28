package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.MedicalFacility;
import com.example.clinic_appointment.enums.MedicalFacilityType;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class MedicalFacilityResponse {

    private Long id;

    private String name;

    private MedicalFacilityType type;

    public static MedicalFacilityResponse fromMedicalFacility(MedicalFacility medicalFacility) {
        return MedicalFacilityResponse.builder()
                .id(medicalFacility.getId())
                .name(medicalFacility.getName())
                .type(medicalFacility.getType())
                .build();
    }
}
