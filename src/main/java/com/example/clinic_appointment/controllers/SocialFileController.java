package com.example.clinic_appointment.controllers;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@Slf4j
@RestController()
@RequestMapping("/social_files")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class SocialFileController {
//
//    SocialFileService socialFileService;
//
//    @PostMapping(value = "/uploads/threads/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public ApiResponse<List<SocialFileResponse>> uploadFiles(
//            @PathVariable("id") String threadId,
//            @ModelAttribute("files") MultipartFile[] files
//    ) throws IOException {
//        List<SocialFileResponse> socialFileResponses = socialFileService.uploads(files, threadId);
//        return ApiResponse.<List<SocialFileResponse>>builder()
//                .result(socialFileResponses)
//                .build();
//    }
//
//    @GetMapping("/{fileType}/{fileName}")
//    public ResponseEntity<?> viewImage(@PathVariable("fileType") SocialType fileType, @PathVariable("fileName") String filename) {
//
//        String pathGet = "";
//        if(fileType == SocialType.IMAGE) {
//            pathGet = "images/";
//        } else if(fileType == SocialType.VIDEO) {
//            pathGet = "videos/";
//        }
//
//        try {
//            java.nio.file.Path imagePath = Paths.get("uploads/"+pathGet+filename);
//            UrlResource resource = new UrlResource(imagePath.toUri());
//
//            if (resource.exists()) {
//                String contentType = Files.probeContentType(imagePath);
//                return ResponseEntity.ok()
//                        .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + filename + "\"")
//                        .contentType(MediaType.parseMediaType(contentType))
//                        .body(resource);
//            } else {
//                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//            }
//        } catch (Exception e) {
//            return ResponseEntity.notFound().build();
//        }
//    }
}
