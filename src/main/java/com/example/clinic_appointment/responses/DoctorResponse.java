package com.example.clinic_appointment.responses;


import com.example.clinic_appointment.entities.Appointment;
import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.DoctorSpecialty;
import com.example.clinic_appointment.entities.Specialty;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.Set;
import java.util.stream.Collectors;

@Getter
@Setter
@Builder
public class DoctorResponse {
    @JsonProperty("user")
    private UserResponse userResponse;
    private String position;
    @JsonProperty("years_of_experience")
    private int yearsOfExperience;
    private String introduce;
    private LocationResponse location;
    private Set<SpecialtyResponse> specialties;
    private Set<AppointmentResponse> appointments;

    public static DoctorResponse fromDoctor(Doctor doctor) {
        Set<SpecialtyResponse> specialties = doctor.getDoctorSpecialties()
                .stream()
                .map(
                    DoctorSpecialty::getSpecialty
                ).collect(Collectors.toSet())
                .stream()
                .map(
                        SpecialtyResponse::fromSpecialty
                )
                .collect(Collectors.toSet());
        return DoctorResponse.builder()
                .userResponse(UserResponse.fromUser(doctor))
                .position(doctor.getPosition())
                .yearsOfExperience(doctor.getYearsOfExperience())
                .introduce(doctor.getIntroduce())
                .location(LocationResponse.fromLocation(doctor.getLocation()))
                .specialties(!specialties.isEmpty() ? specialties : null)
                .build();
    }
}