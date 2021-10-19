require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it 'ensures not null title' do
      expect(Post.new.save).to eq(false)
    end
  end
end
