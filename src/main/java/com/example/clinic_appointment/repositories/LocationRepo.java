package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LocationRepo extends JpaRepository<Location, Long> {
}
