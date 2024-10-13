package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.Patient;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AdminResponse {
    private UserResponse userResponse;

    public static PatientResponse fromPatient(Patient patient) {
        return PatientResponse.builder()
                .userResponse(UserResponse.fromUser(patient))
                .build();
    }
}
