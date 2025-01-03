package com.example.clinic_appointment.controllers;

import com.example.clinic_appointment.dtos.LoginDTO;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.UserType;
import com.example.clinic_appointment.exceptions.LockedException;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;
import com.example.clinic_appointment.responses.*;
import com.example.clinic_appointment.services.user.IUserService;
import jakarta.validation.constraints.Null;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Objects;

import static org.springframework.http.HttpStatus.*;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final IUserService userService;

    @PostMapping("/login")
    public ResponseEntity<ResponseObject> login(@RequestBody LoginDTO loginDTO) throws UsernameNotFoundException, LockedException {
        String token = userService.login(loginDTO);
        User userDetails = userService.getUserDetailsFromToken(token, loginDTO.getUserType());

        LoginResponse loginResponse = LoginResponse.builder()
                .token(token)
                .userId(userDetails.getId())
                .userType(loginDTO.getUserType())
                .build();

        return ResponseEntity.ok().body(
            ResponseObject.builder()
                    .timeStamp(LocalDateTime.now())
                    .message("Login successfully!")
                    .status(OK)
                    .statusCode(OK.value())
                    .data(loginResponse)
                    .build()
        );
    }

    @GetMapping("/details/{userType}")
    public ResponseEntity<ResponseObject> getUserDetails(
            @RequestHeader("Authorization") String authorizationHeader,
            @PathVariable("userType") String userType
    ) throws UsernameNotFoundException {
        String extractedToken = authorizationHeader.substring(7); // Loại bỏ "Bearer " từ chuỗi token
        User user = null;
        ResponseObject responseObject =  ResponseObject.builder()
                .message("Get user's detail successfully")
                .status(OK)
                .statusCode(OK.value())
                .build();
        if(Objects.equals(userType, "PATIENT")) {
            user = (Patient) userService.getUserDetailsFromToken(extractedToken, UserType.valueOf(userType));
            responseObject.setData(PatientResponse.fromPatient((Patient) user));
        } else if(Objects.equals(userType, "DOCTOR")) {
            user = (Doctor) userService.getUserDetailsFromToken(extractedToken, UserType.valueOf(userType));
            responseObject.setData(DoctorResponse.fromDoctor((Doctor) user));
        }


        return ResponseEntity.ok().body(
                responseObject
        );
    }

    @PostMapping(value = "/uploads/{userType}",  consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ResponseObject> uploadImage(
            @RequestHeader("Authorization") String authorizationHeader,
            @PathVariable("userType") String userType,
            @ModelAttribute("file") MultipartFile file
    ) throws UsernameNotFoundException, IOException {
        String extractedToken = authorizationHeader.substring(7); // Loại bỏ "Bearer " từ chuỗi token
        User user = userService.uploadImage(file, extractedToken,  UserType.valueOf(userType.toUpperCase()));

        return ResponseEntity.ok().body(
                ResponseObject.builder()
                        .message("Upload image for user successfully")
                        .data(UserResponse.fromUser(user))
                        .status(OK)
                        .statusCode(OK.value())
                        .build()
        );
    }

    @GetMapping("/images/{fileName}")
    public ResponseEntity<?> viewImage(@PathVariable("fileName") String filename) {

        String pathGet = "images/";
//        if(fileType == SocialType.IMAGE) {
//            pathGet = "images/";
//        } else if(fileType == SocialType.VIDEO) {
//            pathGet = "videos/";
//        }

        try {
            Path imagePath = Paths.get("uploads/"+pathGet+filename);
            UrlResource resource = new UrlResource(imagePath.toUri());

            if (resource.exists()) {
                String contentType = Files.probeContentType(imagePath);
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + filename + "\"")
                        .contentType(MediaType.parseMediaType(contentType))
                        .body(resource);
            } else {
                return ResponseEntity.status(NOT_FOUND).body(null);
            }
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

}
