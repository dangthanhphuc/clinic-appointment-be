package com.example.clinic_appointment.services.doctor;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.exceptions.IdNotFoundException;

import java.util.List;

public interface IDoctorService {

    List<Doctor> doctors();
    Doctor doctor(Long id) throws IdNotFoundException;
    Doctor add(List<Long> ids) throws IdNotFoundException;

}
