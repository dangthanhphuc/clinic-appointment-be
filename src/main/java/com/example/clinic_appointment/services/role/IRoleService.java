package com.example.clinic_appointment.services.role;

import com.example.clinic_appointment.entities.Role;
import com.example.clinic_appointment.exceptions.IdNotFoundException;

public interface IRoleService {
    Role getById(Long id) throws IdNotFoundException;
}
