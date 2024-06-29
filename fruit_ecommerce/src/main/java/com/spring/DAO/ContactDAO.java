package com.spring.DAO;

import com.spring.model.ContactMapper;
import com.spring.model.Contacts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ContactDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Contacts> getContacts()
    {
        List<Contacts> contactsList = new ArrayList<Contacts>();
        String sql = "select * from contact";
        contactsList = jdbcTemplate.query(sql, new ContactMapper());
        return contactsList;
    }
}
