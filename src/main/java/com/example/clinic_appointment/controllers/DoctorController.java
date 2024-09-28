package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.exceptions.IdNotFoundException;
import com.example.clinic_appointment.responses.DoctorResponse;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.services.doctor.IDoctorService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

import static org.springframework.http.HttpStatus.*;


@RestController
@RequestMapping("/doctors")
@RequiredArgsConstructor
public class DoctorController {

    private final IDoctorService doctorService;

    @PostMapping("")
    public Doctor post(@RequestBody List<Long> ids) throws IdNotFoundException {
        Doctor doctor = doctorService.add(ids);
        return doctor;
    }

    @GetMapping("")
    public ResponseEntity<ResponseObject> doctors() {
        List<Doctor> doctors = doctorService.doctors();

        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .status(OK)
                        .statusCode(OK.value())
                        .message("Get doctors successfully !")
                        .data(doctors.stream().map(DoctorResponse::fromDoctor).toList())
                        .build()
        );
    }

}

