package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.dtos.RegisterPatientDTO;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;
import com.example.clinic_appointment.responses.PatientResponse;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.services.patient.IPatientService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/patients")
@RequiredArgsConstructor
public class PatientController {

    private final IPatientService patientService;

    @PostMapping("/register")
    public ResponseEntity<ResponseObject> registerPatient(@RequestBody RegisterPatientDTO registerPatientDTO) throws UsernameNotFoundException {

        Patient patient = patientService.register(registerPatientDTO);

        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .message("Patient account registration successfully")
                        .status(OK)
                        .statusCode(OK.value())
                        .data(PatientResponse.fromPatient(patient))
                        .build()
        );
    }
}
