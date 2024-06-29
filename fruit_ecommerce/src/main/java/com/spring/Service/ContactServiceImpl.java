package com.spring.Service;

import com.spring.DAO.ContactDAO;
import com.spring.model.Contacts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactDAO contactDAO = new ContactDAO();

    @Override
    public List<Contacts> getContact() {
        return contactDAO.getContacts();
    }
}
