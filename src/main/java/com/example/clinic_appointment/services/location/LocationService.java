package com.example.clinic_appointment.services.location;

import com.example.clinic_appointment.entities.Location;
import com.example.clinic_appointment.repositories.LocationRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LocationService implements ILocationService{

    private final LocationRepo locationRepo;

    @Override
    public List<Location> locations() {

        return locationRepo.findAll();
    }
}
