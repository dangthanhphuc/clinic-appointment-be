package com.example.clinic_appointment.services.patient;

import com.example.clinic_appointment.dtos.RegisterPatientDTO;
import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.Role;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.UserStatus;
import com.example.clinic_appointment.exceptions.DataNotFoundException;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;
import com.example.clinic_appointment.repositories.DoctorRepo;
import com.example.clinic_appointment.repositories.PatientRepo;
import com.example.clinic_appointment.repositories.RoleRepo;
import com.example.clinic_appointment.utils.JwtTokenUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.net.Authenticator;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PatientService implements IPatientService{

    private final PatientRepo patientRepo;
    private final DoctorRepo doctorRepo;
    private final RoleRepo roleRepo;

    private final AuthenticationManager authenticatorManager;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenUtils jwtTokenUtils;

    @Override
    public Patient register(RegisterPatientDTO registerPatientDTO) throws UsernameNotFoundException {
        Optional<Patient> patientExisting = patientRepo.findByUsername(registerPatientDTO.getUsername());
        Optional<Doctor> doctorExisting = doctorRepo.findByUsername(registerPatientDTO.getUsername());
        // Đã có username này
        if(patientExisting.isPresent() || doctorExisting.isPresent()) {
            throw new UsernameNotFoundException("Username " + registerPatientDTO.getUsername() + " was existing!");
        }

        Role roleExisting = roleRepo.findByName("PATIENT").orElseThrow(
                () -> new DataNotFoundException("Role PATIENT not found!")
        );

        String passwordEncode = passwordEncoder.encode(registerPatientDTO.getPassword());
        Patient patient = Patient.builder()
                .username(registerPatientDTO.getUsername())
                .password(passwordEncode)
                .name(registerPatientDTO.getName())
                .dateOfBirth(registerPatientDTO.getDateOfBirth())
                .gender(registerPatientDTO.isGender())
                .status(UserStatus.ACTIVE)
                .role(roleExisting)
                .build();

        // Thêm các thuộc tính can null
        if(!registerPatientDTO.getEmail().isEmpty()){
            patient.setEmail(registerPatientDTO.getEmail());
        }
        if(!registerPatientDTO.getAddress().isEmpty()){
            patient.setAddress(registerPatientDTO.getAddress());
        }
        if(!registerPatientDTO.getPhoneNumber().isEmpty()){
            patient.setPhoneNumber(registerPatientDTO.getPhoneNumber());
        }

        return patientRepo.save(patient);
    }
}
