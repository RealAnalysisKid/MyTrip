class City < ApplicationRecord
  validates :title, presence: true

  has_many :posts
  belongs_to :user

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
