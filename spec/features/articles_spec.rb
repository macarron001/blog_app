require 'rails_helper'

RSpec.describe "Articles", type: :feature do
  describe "View new article page" do
    before { visit new_article_path }

    it "shows a 'new' page" do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Body'
      expect(page).to have_selector(:link_or_button, "Create Article")
    end
  end

  describe "fill up form and submit" do
    before { visit new_article_path }


    it 'submits the form' do
      within 'form' do
        fill_in 'article_title', with: "Bork"
        fill_in 'article_body', with: "Boopy"
        click_on "Create Article"
      end

      expect(page).to have_content "Articles"
    end
  end

  describe "edit an article" do

    let(:article) { Article.create!(title: "Bork", body: "Boopy") }
    before { visit "/articles/#{article.id}/edit" }

    it 'edits the form' do
      within 'form' do
        fill_in 'article_title', with: "Borky"
        fill_in 'article_body', with: "Boopy"
        click_on 'Update Article'
      end

      new_article = Article.find(article.id)
      expect(new_article.title).to eq "Borky"
    end
  end

  describe "delete an article" do

    let(:article) { Article.create!(title: "Bork", body: "Boopy") }
    before { visit "/articles/#{article.id}" }

    it "deletes the article" do
      expect(page).to have_selector(:link_or_button, 'Destroy this article')

      click_on 'Destroy this article'

      expect(Article.count).to eq(0)
    end

  end
end