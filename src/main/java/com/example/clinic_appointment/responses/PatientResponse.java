package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.Patient;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@Builder
public class PatientResponse {
    private UserResponse userResponse;

    public static PatientResponse fromPatient(Patient patient) {
        return PatientResponse.builder()
                .userResponse(UserResponse.fromUser(patient))
                .build();
    }
}
