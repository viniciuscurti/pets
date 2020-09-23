class Pet < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  
  def adopted!
    self.adopted = true
    save
  end
end
