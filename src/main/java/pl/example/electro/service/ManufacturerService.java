package pl.example.electro.service;

import pl.example.electro.entity.Manufacturer;

import java.util.List;

public interface ManufacturerService {

    List<Manufacturer> findAll();

    Manufacturer save(Manufacturer producer);
}
