package com.example.clinic_appointment.services.doctor;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Role;
import com.example.clinic_appointment.entities.Specialty;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.exceptions.IdNotFoundException;
import com.example.clinic_appointment.repositories.DoctorRepo;
import com.example.clinic_appointment.repositories.SpecialtyRepo;
import com.example.clinic_appointment.services.role.IRoleService;
import com.example.clinic_appointment.services.specialty.ISpecialtyService;
import com.example.clinic_appointment.services.specialty.SpecialtyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class DoctorService implements IDoctorService{

    private final ISpecialtyService specialtyService;
    private final IRoleService roleService;

    private final DoctorRepo doctorRepo;

    @Override
    public List<Doctor> doctors() {
        return doctorRepo.findAll();
    }

    @Override
    public Doctor doctor(Long id) throws IdNotFoundException {
        return doctorRepo.findById(id).orElseThrow(() -> new IdNotFoundException("Doctor not found"));
    }

    @Transactional(rollbackFor = IdNotFoundException.class)
    @Override
    public Doctor add(List<Long> ids) throws IdNotFoundException {

        Set<Specialty> specialties = new HashSet<>();
        for (Long id : ids) {
            Specialty esixtingSpecialty = specialtyService.getById(id);
            specialties.add(esixtingSpecialty);
        }

        Role existingRole = roleService.getById(1L);

        return null;
    }
}
