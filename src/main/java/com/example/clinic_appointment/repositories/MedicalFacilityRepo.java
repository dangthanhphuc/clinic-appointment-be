package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.MedicalFacility;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicalFacilityRepo extends JpaRepository<MedicalFacility, Long> {
}
