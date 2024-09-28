package com.example.clinic_appointment.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "locations")
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email" ,nullable = false)
    private String email;

    @Column(name = "img_url", columnDefinition = "varchar(255) default 'none.jpg'")
    private String imgUrl;

    @Column(name = "address", nullable = false)
    private String address;

//    @Column(name = "address_url") // Không cho phép null
//    private String addressUrl;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Column(name = "description")
    private String description;

    @ManyToOne(optional = false)
    @JoinColumn(name = "medical_facility_id", nullable = false)
    private MedicalFacility medicalFacility;

}
