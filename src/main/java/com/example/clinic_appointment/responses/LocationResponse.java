package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.Location;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
public class LocationResponse {

    private Long id;

    private String name;

    private String email;

    @JsonProperty("img_url")
    private String imgUrl;

    private String address;

    @JsonProperty("phone_number")
    private String phoneNumber;

    private String description;

    @JsonProperty("medical_facility")
    private MedicalFacilityResponse medicalFacility;

    public static LocationResponse fromLocation(Location location) {
        return LocationResponse.builder()
                .id(location.getId())
                .name(location.getName())
                .email(location.getEmail())
                .imgUrl(location.getImgUrl())
                .address(location.getAddress())
                .phoneNumber(location.getPhoneNumber())
                .description(location.getDescription())
                .medicalFacility(MedicalFacilityResponse.fromMedicalFacility(location.getMedicalFacility()))
                .build();
    }

}
