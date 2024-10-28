package com.example.clinic_appointment.entities.ids;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Specialty;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
@Embeddable
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DoctorSpecialtyId implements Serializable {

    @ManyToOne
    @JoinColumn(name = "specialty_id")
    private Specialty specialty;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;
}
