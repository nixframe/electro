package pl.example.electro.service;

import pl.example.electro.entity.Manufacturer;

import java.util.List;

public interface MAnufacturerService {

    List<Manufacturer> getAll();

    Manufacturer save(Manufacturer manufacturer);
}
