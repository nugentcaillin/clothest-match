class Card {
    String url = "";

    int getId() {
        return id;
    }

    void setId(int id) {
        this.id = id;
    }

    String getUrl() {
        return url;
    }

    void setUrl(String url) {
        this.url = url;
    }

    int id = 0;

    String toString() {
        return id.toString();
    }

}
