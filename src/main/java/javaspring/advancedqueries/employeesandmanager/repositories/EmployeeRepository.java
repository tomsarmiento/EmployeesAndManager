package javaspring.advancedqueries.employeesandmanager.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javaspring.advancedqueries.employeesandmanager.models.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Long>{
	@Query("SELECT e FROM Employee e WHERE e.manager=null")
	List<Employee> findManagers();
}
