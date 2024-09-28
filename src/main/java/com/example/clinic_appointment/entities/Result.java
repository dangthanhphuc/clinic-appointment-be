package com.example.clinic_appointment.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "results")
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "reason", nullable = false)
    private String reason;

    @Column(name = "clinical_diagnosis", nullable = false)
    private String clinicalDiagnosis;

    @Column(name = "diagnostic_results", nullable = false)
    private String diagnosticResults;

    @Column(name = "treatment_plan")
    private String treatmentPlan;

    @Column(name = "advice")
    private String advice;

    @OneToMany(mappedBy = "result", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<ResultImage> images = new HashSet<>();
}
