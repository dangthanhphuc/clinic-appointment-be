package com.example.clinic_appointment.services.patient;

import com.example.clinic_appointment.dtos.RegisterPatientDTO;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;

public interface IPatientService {
    Patient register(RegisterPatientDTO registerPatientDTO) throws UsernameNotFoundException;
}
