package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.Specialty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpecialtyRepo extends JpaRepository<Specialty, Long> {
}
