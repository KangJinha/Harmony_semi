package com.harmony.ensemble.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Inst {
	private String instCode;
	private String instName;
}
