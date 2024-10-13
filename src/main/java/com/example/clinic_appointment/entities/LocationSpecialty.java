package com.example.clinic_appointment.entities;

import com.example.clinic_appointment.entities.ids.LocationSpecialtyId;
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
@Table(name = "location_specialties")
public class LocationSpecialty {

    @EmbeddedId
    private LocationSpecialtyId locationSpecialtyId;

}
