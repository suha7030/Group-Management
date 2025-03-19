package com.example.demo.services;

import java.util.List;
import java.util.Optional;


import javax.validation.Valid;



import com.example.demo.entities.Group;

public interface GroupService {

	List<Group> getAllGroups();

	boolean isGroupNameExists(String groupName);


	@Valid Group addGroup(@Valid Group group);

	Optional<Group> getGroupById(int groupId);

	Group updateGroup(@Valid Group group);

	void deleteProduct(int groupId);

	

	

	
	


	



	

	
}
