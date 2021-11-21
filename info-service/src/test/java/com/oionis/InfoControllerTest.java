package com.oionis;

import com.oionis.controller.InfoController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(InfoController.class)
class InfoControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void shouldReturnStatusOk() throws Exception {
        String localhost = "http://localhost:8076/";
        mockMvc.perform(MockMvcRequestBuilders.get(localhost))
                .andExpect(status().isOk())
                .andReturn();
    }
}
