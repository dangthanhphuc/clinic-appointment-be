package com.example.clinic_appointment.services.specialty;

import com.example.clinic_appointment.entities.Specialty;
import com.example.clinic_appointment.exceptions.IdNotFoundException;

import java.util.List;

public interface ISpecialtyService {

    List<Specialty> specialties();
    Specialty getById(Long id) throws IdNotFoundException;

}
