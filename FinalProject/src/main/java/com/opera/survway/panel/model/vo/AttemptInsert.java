/**
 * 
 */
package com.opera.survway.panel.model.vo;

/**
 * @author Sooo
 *
 */
public class AttemptInsert {
	private int mno;
	private int researchNo;
	
	public AttemptInsert() {}

	public AttemptInsert(int mno, int researchNo) {
		super();
		this.mno = mno;
		this.researchNo = researchNo;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getResearchNo() {
		return researchNo;
	}

	public void setResearchNo(int researchNo) {
		this.researchNo = researchNo;
	}

	@Override
	public String toString() {
		return "AttemptInsert [mno=" + mno + ", researchNo=" + researchNo + "]";
	}
	
}
