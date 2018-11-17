package com.bit.bnb.user.service;

import java.text.SimpleDateFormat;
import java.util.Locale;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DateCheckService {

	@Transactional
	public static boolean dateCheck(String date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		dateFormat.setLenient(false);
		try {
			dateFormat.parse(date);
			return true;
		} catch(Exception ex) {
			return false;
		}
	}

}
