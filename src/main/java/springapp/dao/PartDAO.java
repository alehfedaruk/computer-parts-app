package springapp.dao;

import springapp.model.ComputerPart;

import java.util.List;

public interface PartDAO {
    List<ComputerPart> allParts(int page);
    void add (ComputerPart part);
    void delete (ComputerPart part);
    void update (ComputerPart part);
    ComputerPart getPartById(int id);
    int partsCount();
    int availability();
    List<ComputerPart> searchByName(String name);
    List<ComputerPart> filtered(String option);
}
