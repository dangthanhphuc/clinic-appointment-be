package com.example.clinic_appointment;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
public class ClinicAppointmentApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClinicAppointmentApplication.class, args);
		System.out.println("clinic-appointment started");
	}

}
