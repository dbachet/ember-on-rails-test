class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title, :body, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
