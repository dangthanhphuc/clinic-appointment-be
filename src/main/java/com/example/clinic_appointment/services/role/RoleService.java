package com.example.clinic_appointment.services.role;

import com.example.clinic_appointment.entities.Role;
import com.example.clinic_appointment.exceptions.IdNotFoundException;
import com.example.clinic_appointment.repositories.RoleRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RoleService implements IRoleService{

    private final RoleRepo roleRepo;

    @Override
    public Role getById(Long id) throws IdNotFoundException {
        return roleRepo.findById(id).orElseThrow(
                () -> new IdNotFoundException("Role id not found")
        );
    }
}
