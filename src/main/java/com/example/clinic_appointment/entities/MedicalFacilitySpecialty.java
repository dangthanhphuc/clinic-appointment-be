package com.example.clinic_appointment.entities;

import com.example.clinic_appointment.entities.ids.MedicalFacilitySpecialtyId;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "medical_facility_specialties")
public class MedicalFacilitySpecialty {

    @EmbeddedId
    private MedicalFacilitySpecialtyId medicalFacilitySpecialtyId;

}
