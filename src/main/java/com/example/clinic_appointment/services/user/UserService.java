package com.example.clinic_appointment.services.user;

import com.example.clinic_appointment.dtos.CreateUserDTO;
import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.UserType;
import com.example.clinic_appointment.repositories.DoctorRepo;
import com.example.clinic_appointment.repositories.PatientRepo;
import com.example.clinic_appointment.repositories.UserRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService{

    private final UserRepo userRepo;
    private final DoctorRepo doctorRepo;
    private final PatientRepo patientRepo;

    private final PasswordEncoder passwordEncoder;

    @Override
    public User add(CreateUserDTO createUserDTO) {

        String passwordEncoded = passwordEncoder.encode(createUserDTO.getPassword());

        if(createUserDTO.getType() == UserType.PATIENT) {
            Patient patient = Patient.builder()
                    .dateOfBirth(createUserDTO.getDateOfBirth())
                    .name(createUserDTO.getName())
                    .gender(createUserDTO.isGender())
                    .userName(createUserDTO.getUsername())
                    .password(passwordEncoded)
                    .build();
            return patientRepo.save(patient);
        }else if (createUserDTO.getType() == UserType.DOCTOR){
            Doctor doctor = Doctor.builder()
                    .dateOfBirth(createUserDTO.getDateOfBirth())
                    .name(createUserDTO.getName())
                    .gender(createUserDTO.isGender())
                    .userName(createUserDTO.getUsername())
                    .password(passwordEncoded)
                    .build();
            return doctorRepo.save(doctor);
        }
        return null;
    }
}
