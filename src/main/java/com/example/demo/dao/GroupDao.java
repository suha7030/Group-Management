package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Group;
import com.example.demo.repo.GroupRepository;
import com.example.demo.services.GroupService;

@Service
public class GroupDao implements GroupService {

	
	@Autowired
	GroupRepository repo;

	@Override
	public List<Group> getAllGroups() {
		
		return (List<Group>) repo.findAll();
	}

	@Override
	public boolean isGroupNameExists(String groupName) {
		
		return repo.existsByGroupName(groupName);
	}


	
	@Override
	public @Valid Group addGroup(@Valid Group group) {
		if (isGroupNameExists(group.getGroupName())) {
            throw new RuntimeException("Group name already exists!");
        }
              return repo.save(group);
		
	}

	@Override
	public Optional<Group> getGroupById(int groupId) {
		
		return repo.findById(groupId);
	}

	@Override
	public Group updateGroup(@Valid Group group) {
		Optional<Group> existingGroup = repo.findById(group.getGroupId());
		 if (existingGroup.isPresent()) {
	            Group updatedGroup = existingGroup.get();
	            updatedGroup.setGroupName(group.getGroupName());
	            return repo.save(updatedGroup);
	            
	        } else {
	            throw new RuntimeException("Group not found!");
	        }
		
	}

	@Override
	public void deleteProduct(int groupId) {
		repo.deleteById(groupId);
		
	}

	

	
	

	

	
	
	
	
}
