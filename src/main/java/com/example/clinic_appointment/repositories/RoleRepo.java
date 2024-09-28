package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepo  extends JpaRepository<Role, Long> {
}
