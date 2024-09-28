package com.example.clinic_appointment.responses;


import com.example.clinic_appointment.entities.Doctor;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Setter
@Getter
@SuperBuilder
public class DoctorResponse {

    private String position;

    @JsonProperty("years_of_experience")
    private int yearsOfExperience;

    private String introduce;

    private LocationResponse location;

    @JsonProperty("user")
    private UserResponse userResponse;

    public static DoctorResponse fromDoctor(Doctor doctor) {
        return DoctorResponse.builder()
                .userResponse(UserResponse.fromUser(doctor))
                .position(doctor.getPosition())
                .yearsOfExperience(doctor.getYearsOfExperience())
                .introduce(doctor.getIntroduce())
                .location(LocationResponse.fromLocation(doctor.getLocation()))
                .build();
    }
}
