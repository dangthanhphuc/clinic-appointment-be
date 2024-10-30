package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.entities.AppointmentType;
import com.example.clinic_appointment.responses.AppointmentTypeResponse;
import com.example.clinic_appointment.responses.LocationResponse;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.services.appointment_type.IAppointmentTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/appointment-types")
@RequiredArgsConstructor
public class AppointmentTypeController {

    private final IAppointmentTypeService appointmentTypeService;

    @GetMapping("")
    public ResponseEntity<ResponseObject> getAppointmentTypes() {
        List<AppointmentType> appointmentTypes =  appointmentTypeService.getAll();

        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .status(OK)
                        .message("Get appointment type successfully !")
                        .data(appointmentTypes.stream().map(AppointmentTypeResponse::fromAppointmentType).toList())
                        .build()
        );
    }
}
