package com.example.clinic_appointment.responses;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResponseObject {
    private LocalDateTime timeStamp;
    private int statusCode;
    private HttpStatus status;
    private String message;
    private Object data;
}
