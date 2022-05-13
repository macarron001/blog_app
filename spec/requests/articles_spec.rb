require 'rails_helper'

RSpec.describe "ArticlesControllers", type: :request do

  describe "GET/articles/new" do
    it "returns the 'new' page" do
      get "/articles/new"

      expect(response).to have_http_status(200)
    end
  end

  describe "POST/articles" do
    it "creates a new article" do

      expect {post "/articles", params: {article: {title: "Bork", boddy: "Boopy"}} }.to \
        change(Article, :count)
        .by(1)

      expect(response).to have_http_status(302)
    end
  end

  describe "GET/articles/1/edit" do
    it "returns the edit page" do
      article = Article.create!({title: "Bork", body: "Boopy"})
      get "/articles/#{article.id}/edit"

      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH/articles/1/edit" do
    it "updates the category" do
      article = Article.create!({title: "Bork", body: "Boopy"})
      
      patch "/articles/#{article.id}", params: {article: {title: "New Bork", body: "New Boopy"}}

      edited_article = Article.find(article.id)
      expect(edited_article.title).to eq 'New Bork'
    end
  end

  describe "GET/articles/1" do
    it "returns the article details page" do
      article = Article.create!({title: "Bork", body: "Boopy"})
      get "/articles/#{article.id}"

      expect(response).to have_http_status(200)
    end
  end
end