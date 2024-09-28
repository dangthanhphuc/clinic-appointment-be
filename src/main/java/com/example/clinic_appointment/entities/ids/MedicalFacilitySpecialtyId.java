package com.example.clinic_appointment.entities.ids;

import com.example.clinic_appointment.entities.MedicalFacility;
import com.example.clinic_appointment.entities.Specialty;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Embeddable
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MedicalFacilitySpecialtyId {

    @ManyToOne
    @JoinColumn(name = "specialty_id")
    private Specialty specialty;

    @ManyToOne
    @JoinColumn(name = "medical_facility_id")
    private MedicalFacility medicalFacility;
}
