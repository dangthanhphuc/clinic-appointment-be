package com.example.clinic_appointment.services.appointment;

import com.example.clinic_appointment.dtos.CreateAppointmentDTO;
import com.example.clinic_appointment.entities.Appointment;
import com.example.clinic_appointment.entities.AppointmentType;
import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.enums.AppointmentStatus;
import com.example.clinic_appointment.exceptions.IdNotFoundException;
import com.example.clinic_appointment.repositories.AppointmentRepo;
import com.example.clinic_appointment.repositories.AppointmentTypeRepo;
import com.example.clinic_appointment.repositories.DoctorRepo;
import com.example.clinic_appointment.repositories.PatientRepo;
import com.example.clinic_appointment.services.patient.PatientService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AppointmentService implements IAppointmentService {

    private final AppointmentRepo appointmentRepo;
    private final PatientRepo patientRepo;
    private final DoctorRepo doctorRepo;
    private final AppointmentTypeRepo appointmentTypeRepo;

    @Override
    public Appointment create(CreateAppointmentDTO createAppointmentDTO) throws IdNotFoundException {

        Patient existingPatient = patientRepo.findById(createAppointmentDTO.getPatientId())
                .orElseThrow(
                        () -> new IdNotFoundException("Patient not found with id: " + createAppointmentDTO.getPatientId())
                );

        Doctor existingDoctor = doctorRepo.findById(createAppointmentDTO.getDoctorId())
                .orElseThrow(
                        () -> new IdNotFoundException("Doctor not found with id: " + createAppointmentDTO.getDoctorId())
                );
        AppointmentType existingType = appointmentTypeRepo.findById(createAppointmentDTO.getAppointmentTypeId())
                .orElseThrow(
                        () -> new IdNotFoundException("Appointment type not found with id: " + createAppointmentDTO.getAppointmentTypeId())
                );

        Appointment appointment = Appointment.builder()
                .patient(existingPatient)
                .doctor(existingDoctor)
                .type(existingType)
                .price(100)
                .startTime(createAppointmentDTO.getStartTime())
                .endTime(createAppointmentDTO.getEndTime())
                .status(AppointmentStatus.SCHEDULED)
                .note(createAppointmentDTO.getNote())
                .build();

        return appointmentRepo.save(appointment);
    }
}
