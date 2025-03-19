package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.entities.Group;
import com.example.demo.services.GroupService;

@Controller
@RequestMapping("/groups")
public class GroupController {
	
	@Autowired
    private GroupService groupService;

    // Show all groups on the dashboard
    @GetMapping("/dash")
    public String showGroups(Model model) {
        List<Group> groups = groupService.getAllGroups();
        model.addAttribute("groups", groups);
        return "group-dashboard"; // JSP page for viewing groups
    }

    // Show the "Add Group" form
    @GetMapping("/add")
    public String showAddGroupForm(Model model) {
        model.addAttribute("group", new Group());
        return "add-group"; // JSP page for adding a new group
    }

    // Handle adding a new group
    @PostMapping("/add")
    public String addGroup(@Valid @ModelAttribute("group") Group group, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add-group";
        }
        
        if (groupService.isGroupNameExists(group.getGroupName())) {
            model.addAttribute("errorMessage", "Group name already exists!");
            return "add-group";
        }
        
        groupService.addGroup(group);
        return "redirect:/groups/dash"; // Redirect to dashboard after adding
    }

 // Show the "Update Group" form
    @GetMapping("/edit/{groupId}")
    public String showUpdateForm(@PathVariable int groupId, Model model) {
        Optional<Group> group = groupService.getGroupById(groupId);
        if (group.isPresent()) {
            model.addAttribute("group", group.get());
            return "edit-group"; // JSP page for editing a group
        } else {
            return "redirect:/groups/dash"; // If not found, go back to dashboard
        }
    }
    
 // Handle updating a group
    @PostMapping("/update")
    public String updateGroup(@Valid @ModelAttribute("group") Group group, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "edit-group";
        }
        
        groupService.updateGroup(group);
        return "redirect:/groups/dash"; // Redirect to dashboard after updating
    }

    @GetMapping("/delete/{groupId}")
    public String deleteData(@PathVariable int groupId) {
    	groupService.deleteProduct(groupId);
    	return "redirect:/groups/dash";
    	
    }
    
    
}
