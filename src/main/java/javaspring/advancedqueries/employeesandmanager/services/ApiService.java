package javaspring.advancedqueries.employeesandmanager.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import javaspring.advancedqueries.employeesandmanager.models.Employee;
import javaspring.advancedqueries.employeesandmanager.repositories.EmployeeRepository;

@Service
public class ApiService {
	private final EmployeeRepository r;

	public ApiService(EmployeeRepository r) {
		this.r = r;
	}
	
	public List<Employee> findEmployees(Long mId){
		return (List<Employee>) r.findAll();
	}
	
	public void createEmployee(Employee e) {
		r.save(e);
	}
	
	public void addEmployeeToManager(Employee e, Long mId) {
		Employee manager = r.findById(mId).get();
		List<Employee> employees = manager.getEmployees();
		employees.add(e);
		manager.setEmployees(employees);
		r.save(manager);
	}
	
	public List<Employee> findManagers(){
		return r.findManagers();
	}
	
	public List<Employee[]> findEmployees(){
		List<Employee> managers = r.findManagers();
		List<Employee[]> managersEmployees = new ArrayList<Employee[]>();
		for(Employee m : managers) {
			List<Employee> mEmployees = m.getEmployees();
			Employee[] employees = new Employee[mEmployees.size()];
			for(int i=0; i<mEmployees.size(); i++) {
				employees[i] = mEmployees.get(i);
			}
			managersEmployees.add(employees);
		}
		return managersEmployees;
	}
}
