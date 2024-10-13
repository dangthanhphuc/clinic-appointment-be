package com.example.clinic_appointment.exceptions;

public class UserTypeNotFoundException extends RuntimeException {
    public UserTypeNotFoundException(String message) {
        super(message);
    }
}
