package eci.edu.nombre.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NombreController {

    @GetMapping("/Alejandro")
    public String obtenerNombre() {
        return "Alejandro Prieto";
    }
}
