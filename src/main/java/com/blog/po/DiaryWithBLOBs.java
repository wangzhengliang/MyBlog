package com.blog.po;

public class DiaryWithBLOBs extends Diary {
    private String contentBase;

    private String content;

    public String getContentBase() {
        return contentBase;
    }

    public void setContentBase(String contentBase) {
        this.contentBase = contentBase == null ? null : contentBase.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}