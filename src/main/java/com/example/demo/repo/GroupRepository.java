package com.example.demo.repo;


import java.util.Optional;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Group;

@Repository
public interface GroupRepository extends CrudRepository<Group, Integer> {

	boolean existsByGroupName(String groupName);

	Optional<Group> findById(int groupId);

	int existsByGroupId(int groupId);
	
	 

}
