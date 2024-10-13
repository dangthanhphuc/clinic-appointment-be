package com.example.clinic_appointment.entities;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

@Entity
@Table(name = "patients")
@Getter
@Setter
@NoArgsConstructor
@SuperBuilder
public class Patient extends User {
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }


}
