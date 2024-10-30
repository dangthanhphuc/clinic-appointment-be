package com.example.clinic_appointment.services.appointment_type;

import com.example.clinic_appointment.entities.AppointmentType;
import com.example.clinic_appointment.repositories.AppointmentTypeRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AppointmentTypeService implements  IAppointmentTypeService {

    private final AppointmentTypeRepo appointmentTypeRepo;

    @Override
    public List<AppointmentType> getAll() {
        return appointmentTypeRepo.findAll();
    }
}
