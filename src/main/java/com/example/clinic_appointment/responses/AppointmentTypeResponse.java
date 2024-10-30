package com.example.clinic_appointment.responses;

import com.example.clinic_appointment.entities.AppointmentType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.experimental.FieldDefaults;

@FieldDefaults(makeFinal = true)
@Builder
public class AppointmentTypeResponse {
    @JsonProperty("id")
    Long id;
    @JsonProperty("name")
    String name;
    @JsonProperty("description")
    String description;

    public static AppointmentTypeResponse fromAppointmentType(AppointmentType appointmentType) {
        return AppointmentTypeResponse.builder()
                .id(appointmentType.getId())
                .name(appointmentType.getName())
                .description(appointmentType.getDescription())
                .build();  // Your implementation here to build the response object from the AppointmentType entity.
    }
}
