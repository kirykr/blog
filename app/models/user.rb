class User < ApplicationRecord
  has_many :comments

  validates :username, presence: true, uniqueness: { case_sensitive: false },
                         length: { minimum: 2, maximum: 50 }
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, uniqueness: true, 
                      length: { minimum: 2, maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }

end
