package com.happyheaven.string.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringUtil {
	
	private static final int HASH_CONSTANT = 1083;
	private static final String HASH_ALGORITHM = "SHA-256";
	
	public static String hashString(String input)
	{
		StringBuilder sb = new StringBuilder();
		byte[] hashedBytes = null;
		char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		
		try 
		{
			MessageDigest md = MessageDigest.getInstance(HASH_ALGORITHM);
			
			for(int i = 0; i < HASH_CONSTANT; i++)
			{
				hashedBytes = md.digest(input.getBytes());
			}
			
			
			
			if(null != hashedBytes)
			{
				for (int idx = 0; idx < hashedBytes.length; ++idx) 
				{
					byte b = hashedBytes[idx];
					sb.append(digits[(b & 0xf0) >> 4]);
					sb.append(digits[b & 0x0f]);
				}
				
				System.out.println(sb.toString());
			}
			
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		
		
		
		return sb.toString();
	}

}
