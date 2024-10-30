package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.dtos.CreateAppointmentDTO;
import com.example.clinic_appointment.entities.Appointment;
import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.exceptions.IdNotFoundException;
import com.example.clinic_appointment.responses.AppointmentResponse;
import com.example.clinic_appointment.responses.DoctorResponse;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.services.appointment.IAppointmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/appointments")
@RequiredArgsConstructor
public class AppointmentController {

    private final IAppointmentService appointmentService;

    @PostMapping("")
    public ResponseEntity<ResponseObject> create(
            @RequestBody CreateAppointmentDTO createAppointmentDTO
    ) throws IdNotFoundException {
        Appointment appointment = appointmentService.create(createAppointmentDTO);

        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .status(OK)
                        .message("Get doctors successfully !")
                        .data(AppointmentResponse.fromAppointment(appointment))
                        .build()
        );
    }

}
