package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.*;
import com.example.clinic_appointment.enums.AppointmentStatus;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@FieldDefaults(makeFinal = true)
@Builder
public class AppointmentResponse {

    private Long id;

    @JsonProperty("start_time")
    private LocalDateTime startTime;

    @JsonProperty("end_time")
    private LocalDateTime endTime;

    private AppointmentStatus status;

    private String note;

    private float price;

    private AppointmentTypeResponse type;

//    private Doctor doctor;

    private PatientResponse patient;

//    private Result result;

    public static AppointmentResponse fromAppointment(Appointment appointment) {
        return AppointmentResponse.builder()
                .id(appointment.getId())
                .startTime(appointment.getStartTime())
                .endTime(appointment.getEndTime())
                .status(appointment.getStatus())
                .note(appointment.getNote())
                .price(appointment.getPrice())
                .type(AppointmentTypeResponse.fromAppointmentType(appointment.getType()))
                .patient(PatientResponse.fromPatient(appointment.getPatient()))
                .build();
    }
}
