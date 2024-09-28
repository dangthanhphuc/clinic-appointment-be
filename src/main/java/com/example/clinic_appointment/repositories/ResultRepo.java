package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.Result;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResultRepo extends JpaRepository<Result, Long> {
}
