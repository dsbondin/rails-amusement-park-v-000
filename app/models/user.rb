class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates_presence_of :name
  has_secure_password

  def mood
    if self.happiness > self.nausea
      "happy"
    elsif self.happiness < self.nausea
      "sad"
    else
      "neutral"
    end
  end

end
