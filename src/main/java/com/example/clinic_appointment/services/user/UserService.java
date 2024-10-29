package com.example.clinic_appointment.services.user;

import com.example.clinic_appointment.dtos.LoginDTO;

import com.example.clinic_appointment.entities.Doctor;
import com.example.clinic_appointment.entities.Patient;
import com.example.clinic_appointment.entities.User;
import com.example.clinic_appointment.enums.SocialType;
import com.example.clinic_appointment.enums.UserStatus;
import com.example.clinic_appointment.enums.UserType;
import com.example.clinic_appointment.exceptions.LockedException;
import com.example.clinic_appointment.exceptions.UserTypeNotFoundException;
import com.example.clinic_appointment.exceptions.UsernameNotFoundException;
import com.example.clinic_appointment.repositories.DoctorRepo;
import com.example.clinic_appointment.repositories.PatientRepo;
import com.example.clinic_appointment.utils.FileUtils;
import com.example.clinic_appointment.utils.JwtTokenUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService{

    private final PatientRepo patientRepo;
    private final DoctorRepo doctorRepo;

    private final AuthenticationManager authenticationManager;
    private final JwtTokenUtils jwtTokenUtils;
    private final PasswordEncoder passwordEncoder;

    private User getUserDetailFromUsername(String username, UserType userType) throws UsernameNotFoundException {
        User existingUser;
        switch (userType) {
            case UserType.DOCTOR:
                existingUser = doctorRepo.findByUsername(username).orElseThrow(
                        () -> new UsernameNotFoundException("Username " + username + " not found!")
                );
                break;
            case UserType.PATIENT:
                existingUser = patientRepo.findByUsername(username).orElseThrow(
                        () -> new UsernameNotFoundException("Username " + username + " not found!")
                );
                break;
            default:
                throw new UserTypeNotFoundException("User type not supported!!!");
        }
        return existingUser;
    }

    @Override
    public User getUserDetailsFromToken(String token, UserType userType) throws UsernameNotFoundException {
        if(jwtTokenUtils.isTokenExpired(token)) {

        }
        String subject = jwtTokenUtils.getSubject(token);
        User existingUser = getUserDetailFromUsername(subject, userType);

        return existingUser;
    }

    @Override
    public String login(LoginDTO loginDTO) throws UsernameNotFoundException, LockedException {

        User existingUser = getUserDetailFromUsername(loginDTO.getUsername(), loginDTO.getUserType());

        if(existingUser.getStatus() == UserStatus.INACTIVE) {
            throw new LockedException("User account is locked!" + existingUser.getUsername() + "!");
        }

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                loginDTO.getUsername(), loginDTO.getPassword(),
                existingUser.getAuthorities()
        );

        authenticationManager.authenticate(authenticationToken);
        return jwtTokenUtils.generateToken(existingUser);
    }

    @Override
    public User uploadImage(MultipartFile file, String token, UserType userType) throws UsernameNotFoundException, IOException {
        String subject = jwtTokenUtils.getSubject(token);
        User existingUser = getUserDetailFromUsername(subject, userType);

        String contentType = file.getContentType();
        SocialType socialType = null;
        if (contentType != null && contentType.startsWith("image/")) {
            socialType = SocialType.IMAGE;
        } else if (contentType != null && contentType.startsWith("video/")) {
            socialType = SocialType.VIDEO;
        }

        String uniqueFileName = FileUtils.storeFile(file, socialType);
        existingUser.setImgUrl(uniqueFileName);

        // Lưu
        if(existingUser.getRole().getName().equals(UserType.DOCTOR.name())) {
            return doctorRepo.save((Doctor) existingUser);
        }

        return patientRepo.save((Patient) existingUser);
    }

}
