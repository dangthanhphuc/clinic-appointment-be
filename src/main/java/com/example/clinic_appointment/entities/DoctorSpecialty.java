package com.example.clinic_appointment.entities;

import com.example.clinic_appointment.entities.ids.DoctorSpecialtyId;
import jakarta.persistence.*;
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

    @ManyToOne
    @JoinColumn(name = "doctor_id", insertable = false, updatable = false )
    private Doctor doctor;

    @ManyToOne
    @JoinColumn(name = "specialty_id", insertable = false, updatable = false)
    private Specialty specialty;

}
