package com.example.clothestmatch;

import java.util.List;

public class ProductTagNameAndImageURLWrapper {
    private String url;

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    private List<String> tags;
}
