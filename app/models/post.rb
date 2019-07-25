class Post < ApplicationRecord
  belongs_to :city
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
