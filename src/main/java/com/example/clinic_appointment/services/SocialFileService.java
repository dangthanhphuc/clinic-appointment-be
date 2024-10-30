package com.example.clinic_appointment.services;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class SocialFileService {
//
//    SocialFileRepository socialFileRepository;
//    SocialFileMapper socialFileMapper;
//    ThreadRepository threadRepository;
//
//
//    public List<SocialFileResponse> uploads(MultipartFile[] files, String id) throws IOException {
//        List<SocialFile> socialFiles = new ArrayList<>();
//        Thread threadExist = threadRepository.findById(id).orElseThrow(
//                () -> new AppException(ErrorCode.THREAD_NOT_EXISTED)
//        );
//        for (MultipartFile file : files) {
//            String contentType = file.getContentType();
//            SocialType socialType = null;
//            if (contentType != null && contentType.startsWith("image/")) {
//                socialType = SocialType.IMAGE;
//            } else if (contentType != null && contentType.startsWith("video/")) {
//                socialType = SocialType.VIDEO;
//            }
//
//            String uniqueFileName = FileUtils.storeFile(file, socialType);
//            SocialFile socialFile = SocialFile.builder()
//                    .type(socialType)
//                    .url(uniqueFileName)
//                    .thread(threadExist)
//                    .build();
//            socialFiles.add(socialFile);
//        }
//        List<SocialFile> socialFilesSaved = socialFileRepository.saveAll(socialFiles);
//        List<SocialFileResponse> socialFileResponses = socialFilesSaved.stream().map(socialFileMapper::toSocialFileResponse).toList();
//        return socialFileResponses;
//    }


}
