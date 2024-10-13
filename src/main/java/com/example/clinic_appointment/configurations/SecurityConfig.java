package com.example.clinic_appointment.configurations;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.clinic_appointment.repositories.DoctorRepo;
import com.example.clinic_appointment.repositories.PatientRepo;

import java.util.Optional;

@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

    private final DoctorRepo doctorRepo;
    private final PatientRepo patientRepo;

    // Khởi tạo trình cung cấp xác thực
    @Bean
    public AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setPasswordEncoder(passwordEncoder());
        authProvider.setUserDetailsService(userDetailsService());
        return authProvider;
    }

    @Bean
    public AuthenticationManager authenticationManager(
            AuthenticationConfiguration config
    ) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder( ) {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return username -> {
            Optional<Doctor> doctor = doctorRepo.findByUsername(username);
            if (doctor.isPresent()) {
                return doctor.get();
            }

            Optional<Patient> patient = patientRepo.findByUsername(username);
            if (patient.isPresent()) {
                return patient.get();
            }

            throw new UsernameNotFoundException("Username not found!");
        };
    }
}
