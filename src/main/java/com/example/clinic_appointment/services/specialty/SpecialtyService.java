package com.example.clinic_appointment.services.specialty;

import com.example.clinic_appointment.entities.Specialty;
import com.example.clinic_appointment.exceptions.IdNotFoundException;
import com.example.clinic_appointment.repositories.SpecialtyRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SpecialtyService implements ISpecialtyService {

    private final SpecialtyRepo specialtyRepo;

    @Override
    public List<Specialty> specialties() {
        return specialtyRepo.findAll();
    }

    @Override
    public Specialty getById(Long id) throws IdNotFoundException {
        return specialtyRepo.findById(id).orElseThrow(
                () -> new IdNotFoundException("Specialty id not found !")
        );
    }


}
