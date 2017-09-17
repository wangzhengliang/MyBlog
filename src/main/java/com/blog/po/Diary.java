package com.blog.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Diary {
    public Diary() {
		super();
		// TODO Auto-generated constructor stub
	}

	private Integer did;

    private String resource;

    private String title;
    
    private String content_base;
    
    private String content;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date relasedata;

    private String image;

    private Integer typeid;
    
    public String getContent_base() {
		return content_base;
	}

	public Diary(Integer did, String title, String content_base, String content,
			String image, Integer typeid) {
		super();
		this.did = did;
		this.title = title;
		this.content_base = content_base;
		this.content = content;
		this.image = image;
		this.typeid = typeid;
	}

	public void setContent_base(String content_base) {
		this.content_base = content_base;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource == null ? null : resource.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getRelasedata() {
        return relasedata;
    }

    public void setRelasedata(Date relasedata) {
        this.relasedata = relasedata;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }
    
}