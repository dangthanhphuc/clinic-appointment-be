package com.example.clinic_appointment.exceptions;


import com.example.clinic_appointment.responses.ResponseObject;
import org.apache.coyote.Response;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.LocalDateTime;

import static org.springframework.http.HttpStatus.*;

@RestControllerAdvice
public class GlobalExceptionHandle {

    @ExceptionHandler(IdNotFoundException.class)
    public ResponseEntity<ResponseObject> handleIdNotFoundException(Exception ex) {
        return ResponseEntity
                .status(NOT_FOUND)
                .body(
                        ResponseObject.builder()
                                .timeStamp(LocalDateTime.now())
                                .message(ex.getMessage())
                                .status(NOT_FOUND)
                                .build()
                );
    }

    @ExceptionHandler(LockedException.class)
    public ResponseEntity<ResponseObject> handleLockedException(LockedException ex) {
        return ResponseEntity
                .status(LOCKED)
                .body(
                        ResponseObject.builder()
                                .timeStamp(LocalDateTime.now())
                                .message(ex.getMessage())
                                .status(LOCKED)
                                .statusCode(LOCKED.value())
                                .build()
                );
    }

    @ExceptionHandler(UsernameNotFoundException.class)
    public ResponseEntity<ResponseObject> handleUsernameNotFoundException(UsernameNotFoundException ex) {
        return ResponseEntity.status(BAD_REQUEST).body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .message(ex.getMessage())
                        .status(NOT_FOUND)
                        .build()
        );
    }


    @ExceptionHandler(DataNotFoundException.class)
    public ResponseEntity<ResponseObject> handleDataNotFoundException(DataNotFoundException ex) {
        return ResponseEntity.status(BAD_REQUEST).body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .message(ex.getMessage())
                        .status(NOT_FOUND)
                        .build()
        );
    }

    @ExceptionHandler(UserTypeNotFoundException.class)
    public ResponseEntity<ResponseObject> handleUserTypeNotFoundException(UserTypeNotFoundException ex) {
        return ResponseEntity.status(BAD_REQUEST).body(
                ResponseObject.builder()
                        .timeStamp(LocalDateTime.now())
                        .message(ex.getMessage())
                        .status(NOT_FOUND)
                        .build()
        );
    }


}
