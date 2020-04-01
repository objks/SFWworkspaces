package org.zerock.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SampleDTOList {

	private List<SampleDTOList> list;
	
	public SampleDTOList() {
		list = new ArrayList<SampleDTOList>();
	}
}
