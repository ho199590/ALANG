package com.ic.alang.pluspoint.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ic.alang.pluspoint.mapper.PlusPointSQLMapper;
import com.ic.alang.vo.PlusPointVo;

@Service
public class PlusPointServiceImpl {
   
   @Autowired
   private PlusPointSQLMapper plusPointSQLMapper;
   
   public void plusPoint(PlusPointVo vo) {
      plusPointSQLMapper.plusPoint(vo);
   }
   public void updatePoint(PlusPointVo vo) {
      plusPointSQLMapper.updatePoint(vo);
   }
}