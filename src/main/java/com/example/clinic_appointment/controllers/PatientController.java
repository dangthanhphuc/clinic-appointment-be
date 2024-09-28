package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/patients")
public class PatientController {

    @GetMapping("")
    public String get( ) {
        User user = new Patient();
        return user.getClass().getSimpleName();
    }
}
