package basic.service;

import java.util.HashMap;
import java.util.Map;

import basic.model.Customer;


public class CustomerService {
	private Map<String, Customer> customers;
	
	public CustomerService() {
		customers = new HashMap<String, Customer>();
		addCustomer(new Customer("id001", "Alice","alice.snut.ac.kr","용인"));
		addCustomer(new Customer("id002", "Bob","bob.snut.ac.kr","성남"));
		addCustomer(new Customer("id003", "Chalie","Chalie.snut.ac.kr","미금"));
		addCustomer(new Customer("id004", "David","David.snut.ac.kr","천안"));
		addCustomer(new Customer("id005", "Trudy","Trudy.snut.ac.kr","원주"));
		
	}
	public void addCustomer(Customer customer) {
		customers.put(customer.getId(), customer);
	}
	public Customer findCustomer(String id) {
		if(id!=null) return customers.get(id.toLowerCase());
		else return null;
	}
}
