package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.TransactionDTO;

import java.util.List;

public interface ITransactionService {

    List<TransactionDTO> findConditon(String code, Long customerId);

    TransactionDTO save(TransactionDTO dto);

}
