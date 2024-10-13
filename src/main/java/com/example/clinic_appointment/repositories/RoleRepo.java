package com.example.clinic_appointment.repositories;

import com.example.clinic_appointment.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepo  extends JpaRepository<Role, Long> {

    @Query(value = "SELECT r.* FROM roles r " +
            "WHERE UPPER(r.name) = UPPER(:name) ",
            nativeQuery = true)
    Optional<Role> findByName(@Param("name") String name);
}
