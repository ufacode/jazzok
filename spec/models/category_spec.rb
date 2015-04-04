require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is check empty name' do
    category = build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is check empty uri' do
    category = build(:category, uri: nil)
    category.valid?
    expect(category.errors[:uri]).to include("can't be blank")
  end

  it 'is check uniq uri for category' do
    attrs = attributes_for(:category)
    create(:category, attrs)
    category = build(:category, attrs)
    category.valid?
    expect(category.errors[:uri]).to include('has already been taken')
  end
end
