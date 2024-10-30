package com.example.clinic_appointment.utils;

import com.example.clinic_appointment.enums.SocialType;
import org.apache.commons.io.FilenameUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public class FileUtils {
    private final static String IMAGE_UPLOAD_PATH = "uploads/images/";
    private final static String VIDEO_UPLOAD_PATH = "uploads/videos/";


    public static String storeFile(MultipartFile file, SocialType type) throws IOException {
        if(file.getOriginalFilename() == null) {
            throw new IOException("Invalid file format");
        }
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        String extension = FilenameUtils.getExtension(fileName);  // Lấy extension của file gốc
        // Thêm UUID và extension vào tên file để đảm bảo tên file là duy nhất và giữ nguyên extension
        String uniqueFilename = UUID.randomUUID().toString() + "_" + System.nanoTime() + "." + extension;

        // Đường dẫn đến thư mục mà bạn muốn lưu file
        String fileType;
        if(type == SocialType.IMAGE) {
            fileType = IMAGE_UPLOAD_PATH;
        } else if (type == SocialType.VIDEO) {
            fileType = VIDEO_UPLOAD_PATH;
        } else {
            throw new IOException("Type file not exits");
        }

        Path uploadDir = Paths.get(fileType);
        // Kiểm tra và tạo thư mục nếu nó không tồn tại
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }

        Path destination = Paths.get(uploadDir.toString(), uniqueFilename);

        // Sao chép file vào thư mục đích
        Files.copy(file.getInputStream(), destination, StandardCopyOption.REPLACE_EXISTING);
        return uniqueFilename;
    }

    public static void deleteFile(String filename, SocialType type) throws IOException {
        // Đường dẫn đến thư mục chứa file
        String fileType;
        if(type == SocialType.IMAGE) {
            fileType = IMAGE_UPLOAD_PATH;
        } else if (type == SocialType.VIDEO) {
            fileType = VIDEO_UPLOAD_PATH;
        } else {
            throw new IOException("Type file not exits");
        }
        Path uploadDir = Paths.get(fileType);
        // Đường dẫn đầy đủ đến file cần xóa
        Path filePath = uploadDir.resolve(filename);

        // Kiểm tra xem file tồn tại hay không
        if (Files.exists(filePath)) {
            // Xóa file
            Files.delete(filePath);
        } else {
            throw new FileNotFoundException("File not found: " + filename);
        }
    }



}
