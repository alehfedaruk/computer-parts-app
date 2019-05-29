package springapp.controller;

import springapp.model.ComputerPart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import springapp.service.PartService;

import java.util.List;

@Controller
public class PartController {
    private int page;
    private PartService partService;

    @Autowired
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView allParts(@RequestParam(defaultValue = "1") int page) {
        this.page = page;
        List<ComputerPart> parts = partService.allParts(page);
        int availability = partService.availability();
        int partsCount = partService.partsCount();
        int pagesCount = (partsCount + 9) / 10;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("page", page);
        modelAndView.addObject("partsList", parts);
        modelAndView.addObject("partsCount", partsCount);
        modelAndView.addObject("pagesCount", pagesCount);
        modelAndView.addObject("availability", availability);
        return modelAndView;
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public ModelAndView updatePage(@PathVariable("id") int id) {
        ComputerPart computerPart = partService.getPartById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("updatePage");
        modelAndView.addObject("computerPart", computerPart);
        return modelAndView;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updatePart(@ModelAttribute("computerPart") ComputerPart part) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/");
        partService.update(part);
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("updatePage");
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView addPart(@ModelAttribute("computerPart") ComputerPart computerPart) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/");
        partService.add(computerPart);
        return modelAndView;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deletePart(@PathVariable int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/");
        ComputerPart computerPart = partService.getPartById(id);
        partService.delete(computerPart);
        return modelAndView;
    }

    @RequestMapping(value = "/results", method = RequestMethod.GET)
    public ModelAndView searchByName (@RequestParam String name) {
        ModelAndView modelAndView = new ModelAndView();
        List<ComputerPart> found = partService.searchByName(name);
        modelAndView.addObject("found", found);
        modelAndView.setViewName("results");
        return modelAndView;
    }

    @RequestMapping(value = "/filtered", method = RequestMethod.GET)
    public ModelAndView filter (@RequestParam String option) {
        ModelAndView modelAndView = new ModelAndView();
        List<ComputerPart> filtered = partService.filtered(option);
        modelAndView.addObject("filtered", filtered);
        modelAndView.setViewName("filtered");
        return modelAndView;
    }
}