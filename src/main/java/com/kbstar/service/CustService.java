package com.kbstar.service;

import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CustMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustService implements KBService<String, Cust> {
    @Autowired
    CustMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     *
     * @param cust
     */
    @Override
    public void register(Cust cust) throws Exception {

    }

    @Override
    public void remove(String id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        mapper.update(cust);
    }

    @Override
    public Cust get(String id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }
}
