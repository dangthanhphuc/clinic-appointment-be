package com.example.clinic_appointment.services.appointment;

import com.example.clinic_appointment.dtos.CreateAppointmentDTO;
import com.example.clinic_appointment.entities.Appointment;
import com.example.clinic_appointment.exceptions.IdNotFoundException;

public interface IAppointmentService {
    Appointment create(CreateAppointmentDTO createAppointmentDTO) throws IdNotFoundException;
}
