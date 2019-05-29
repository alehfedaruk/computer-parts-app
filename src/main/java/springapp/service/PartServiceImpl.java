package springapp.service;

import springapp.dao.PartDAO;
import springapp.model.ComputerPart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PartServiceImpl implements PartService {
    private PartDAO partDAO;

    @Autowired
    public void setPartDAO(PartDAO partDAO) {
        this.partDAO = partDAO;
    }

    @Override
    @Transactional
    public List<ComputerPart> allParts(int page) {
        return partDAO.allParts(page);
    }

    @Override
    @Transactional
    public void add(ComputerPart part) {
        partDAO.add(part);
    }

    @Override
    @Transactional
    public void delete(ComputerPart part) {
        partDAO.delete(part);
    }

    @Override
    @Transactional
    public void update(ComputerPart part) {
        partDAO.update(part);
    }

    @Override
    @Transactional
    public ComputerPart getPartById(int id) {
        return partDAO.getPartById(id);
    }

    @Override
    @Transactional
    public int partsCount() {
        return partDAO.partsCount();
    }

    @Override
    @Transactional
    public int availability() {
        return partDAO.availability();
    }

    @Override
    @Transactional
    public List<ComputerPart> searchByName(String name) {
        return partDAO.searchByName(name);
    }

    @Override
    @Transactional
    public List<ComputerPart> filtered(String option) {
        return partDAO.filtered(option);
    }
}
