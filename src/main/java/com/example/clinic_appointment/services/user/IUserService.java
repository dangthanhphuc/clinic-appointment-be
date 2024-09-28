package com.example.clinic_appointment.services.user;

import com.example.clinic_appointment.dtos.CreateUserDTO;
import com.example.clinic_appointment.entities.User;

public interface IUserService {
    User add(CreateUserDTO createUserDTO);
}
