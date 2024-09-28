package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.entities.Specialty;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.responses.SpecialtyResponse;
import com.example.clinic_appointment.services.specialty.ISpecialtyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/specialties")
@RequiredArgsConstructor
public class SpecialtyController {

    private final ISpecialtyService specialtyService;

    @GetMapping("")
    public ResponseEntity<?> getSpecialties() {
        List<Specialty> specialties = specialtyService.specialties();

//        return ResponseEntity.ok().body(
//                ResponseObject.builder()
//                        .timeStamp(LocalDateTime.now())
//                        .status(OK)
//                        .statusCode(OK.value())
//                        .message("Get specialties successfully !")
//                        .data(specialties.stream().map(SpecialtyResponse::fromSpecialty).toList())
//                        .build()
//        );
        return ResponseEntity.ok().body(specialties.stream().map(SpecialtyResponse::fromSpecialty).toList());
    }

}
