class Post < ActiveRecord::Base
  acts_as_commontable
  belongs_to :user
  belongs_to :category
  validates :title, :content, presence: true
  before_validation :cut_intro

  private

  def cut_intro
    if intro.blank? && !content.blank?
      self.intro = content.split.first(20).join(' ')
    end
  end
end
