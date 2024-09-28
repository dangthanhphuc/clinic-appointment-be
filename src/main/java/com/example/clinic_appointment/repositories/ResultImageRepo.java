package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.ResultImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResultImageRepo extends JpaRepository<ResultImage, Long> {
}
