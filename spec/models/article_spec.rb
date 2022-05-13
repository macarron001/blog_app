require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article) {Article.new}

  context 'Validations' do

    it 'should create a valid article' do
      article.title = 'Bork'

      expect(article).to be_valid
    end

    it 'is not valid without a title' do
      article.body = 'sample body'

      expect(article).to_not be_valid
    end

    it 'should have a title with a max length of 18' do
      article.title = 'qweqweqweqweqweqweqwe' #21 chars

      expect(article).to_not be_valid
    end

    it 'should have a unique title' do
      Article.create(title: 'Bork')
      article.title = 'Bork'

      expect(article).to_not be_valid
    end
    
  end
end