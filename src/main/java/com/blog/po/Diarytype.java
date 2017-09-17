package com.blog.po;

public class Diarytype {
    private Integer tid;

    private String tname;

    public Diarytype(String tname) {
		super();
		this.tname = tname;
	}

	public Diarytype(Integer tid, String tname) {
		super();
		this.tid = tid;
		this.tname = tname;
	}

	public Diarytype() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }
}