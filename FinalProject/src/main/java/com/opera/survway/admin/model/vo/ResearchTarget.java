package com.opera.survway.admin.model.vo;

public class ResearchTarget {
	private int targetNo;
	private String targetGender;
	private String targetAgeRange;
	private String targetLocation;
	private int minAge;
	private int maxAge;
	private int researchNo;
	private int occupationNo;
	private int researchStateNo;
	private int additionalEtc;
	public ResearchTarget() {
		super();
	}
	public ResearchTarget(int targetNo, String targetGender, String targetAgeRange, String targetLocation, int minAge,
			int maxAge, int researchNo, int occupationNo, int researchStateNo, int additionalEtc) {
		super();
		this.targetNo = targetNo;
		this.targetGender = targetGender;
		this.targetAgeRange = targetAgeRange;
		this.targetLocation = targetLocation;
		this.minAge = minAge;
		this.maxAge = maxAge;
		this.researchNo = researchNo;
		this.occupationNo = occupationNo;
		this.researchStateNo = researchStateNo;
		this.additionalEtc = additionalEtc;
	}
	public int getTargetNo() {
		return targetNo;
	}
	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}
	public String getTargetGender() {
		return targetGender;
	}
	public void setTargetGender(String targetGender) {
		this.targetGender = targetGender;
	}
	public String getTargetAgeRange() {
		return targetAgeRange;
	}
	public void setTargetAgeRange(String targetAgeRange) {
		this.targetAgeRange = targetAgeRange;
	}
	public String getTargetLocation() {
		return targetLocation;
	}
	public void setTargetLocation(String targetLocation) {
		this.targetLocation = targetLocation;
	}
	public int getMinAge() {
		return minAge;
	}
	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}
	public int getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	public int getResearchNo() {
		return researchNo;
	}
	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}
	public int getOccupationNo() {
		return occupationNo;
	}
	public void setOccupationNo(int occupationNo) {
		this.occupationNo = occupationNo;
	}
	public int getResearchStateNo() {
		return researchStateNo;
	}
	public void setResearchStateNo(int researchStateNo) {
		this.researchStateNo = researchStateNo;
	}
	public int getAdditionalEtc() {
		return additionalEtc;
	}
	public void setAdditionalEtc(int additionalEtc) {
		this.additionalEtc = additionalEtc;
	}
	@Override
	public String toString() {
		return "ResearchTarget [targetNo=" + targetNo + ", \ntargetGender=" + targetGender + ", \ntargetAgeRange="
				+ targetAgeRange + ", \ntargetLocation=" + targetLocation + ", \nminAge=" + minAge + ", \nmaxAge=" + maxAge
				+ ", \nresearchNo=" + researchNo + ", \noccupationNo=" + occupationNo + ", \nresearchStateNo="
				+ researchStateNo + ", \nadditionalEtc=" + additionalEtc + "]";
	}
	
	

}
