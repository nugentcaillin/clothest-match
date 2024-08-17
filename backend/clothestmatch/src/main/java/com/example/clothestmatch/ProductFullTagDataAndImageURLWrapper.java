package com.example.clothestmatch;

import java.util.List;

public class ProductFullTagDataAndImageURLWrapper {
    private String url;

    public List<TagData> getTags() {
        return tags;
    }

    public void setTags(List<TagData> tags) {
        this.tags = tags;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    private List<TagData> tags;
}
