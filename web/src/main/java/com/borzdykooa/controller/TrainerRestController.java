package com.borzdykooa.controller;

import com.borzdykooa.entity.Trainer;
import com.borzdykooa.service.TrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

/**
 * Класс, ответственный за получение информации по REST-запросу
 */
@Controller
public class TrainerRestController {

    @Autowired
    private TrainerService trainerService;

    @GetMapping("/trainer")
    public String showTestPage(Model model) {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Trainer> response = restTemplate
                .getForEntity("http://localhost:8081/test",
                        Trainer.class);
        Trainer trainer = response.getBody();
        model.addAttribute("trainer", trainer);
        trainerService.save(trainer);
        return "trainer";
    }
}
