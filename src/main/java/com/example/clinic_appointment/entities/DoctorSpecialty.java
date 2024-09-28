package com.example.clinic_appointment.entities;

import com.example.clinic_appointment.entities.ids.DoctorSpecialtyId;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "doctor_specialties")
public class DoctorSpecialty {

    @EmbeddedId
    private DoctorSpecialtyId id;

}
