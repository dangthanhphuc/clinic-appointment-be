package com.example.clinic_appointment.services.user;

import com.example.clinic_appointment.dtos.CreateUserDTO;
import com.example.clinic_appointment.dtos.LoginDTO;
import com.example.clinic_appointment.dtos.RegisterPatientDTO;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.UserType;
import com.example.clinic_appointment.exceptions.LockedException;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;

public interface IUserService {
    User getUserDetailsFromToken(String token, UserType userType) throws UsernameNotFoundException;

    String login(LoginDTO loginDTO) throws UsernameNotFoundException, LockedException;

}
