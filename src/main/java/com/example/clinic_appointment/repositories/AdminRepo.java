package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.Admin;
import com.example.clinic_appointment.entities.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AdminRepo extends JpaRepository<Admin, Long> {
    Optional<Admin> findByUsername(String username);
}
