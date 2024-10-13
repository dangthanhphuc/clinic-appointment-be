package com.example.clinic_appointment.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "doctors")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Doctor extends User {

    @Column(name = "position", nullable = false)
    private String position;

    @Column(name = "years_of_experience", nullable = false)
    private int yearsOfExperience;
    
    @Column(name = "introduce")
    private String introduce;

    @ManyToOne(optional = false)
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

}
