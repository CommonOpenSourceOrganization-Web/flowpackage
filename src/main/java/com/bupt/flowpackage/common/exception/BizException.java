package com.bupt.flowpackage.common.exception;

import com.bupt.flowpackage.common.enums.ResultCode;

public class BizException extends RuntimeException implements IException {
	private static final long serialVersionUID = 1L;

	private Integer code;
	
	private String msg;
	
	private Integer subCode;
	
	private String subMessage;
	
	public BizException(IException bizExcep) {
		this(bizExcep.getCode(), bizExcep.getMsg(), bizExcep.getSubCode(), bizExcep.getSubMessage());
	}
	
	public BizException(ResultCode resultCode, Integer subCode, String subMessage) {
		this(resultCode.getCode(), resultCode.getMsg(), subCode, subMessage);
	}
	
	public BizException(Integer code, String message, Integer subCode, String subMessage) {
		super(subMessage);
		this.code = code;
		this.msg = message;
		this.subCode = subCode;
		this.subMessage = subMessage;
	}
	
	public static void warn(String subMessage) {
		throw new BizException(ResultCode.Result_WARN, ResultCode.Result_WARN.getCode(), subMessage);
	}

	public static void warn(Integer subCode, String subMessage) {
		throw new BizException(ResultCode.Result_WARN, subCode, subMessage);
	}

	@Override
	public Integer getCode() {
		return code;
	}

	@Override
	public Integer getSubCode() {
		return subCode;
	}

	@Override
	public String getSubMessage() {
		return subMessage;
	}

	@Override
	public String getMsg() {
		return msg;
	}
}
