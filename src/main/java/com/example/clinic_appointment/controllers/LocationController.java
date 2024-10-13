package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Location;
import com.example.clinic_appointment.responses.DoctorResponse;
import com.example.clinic_appointment.responses.LocationResponse;
import com.example.clinic_appointment.responses.ResponseObject;
import com.example.clinic_appointment.services.location.ILocationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/locations")
@RequiredArgsConstructor
public class LocationController {

    private final ILocationService locationService;

    @GetMapping("")
    public ResponseEntity<ResponseObject> locations() {
        List<Location> locations = locationService.locations();

        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .status(OK)
                        .message("Get locations successfully !")
                        .data(locations.stream().map(LocationResponse::fromLocation).toList())
                        .build()
        );
    }


}
