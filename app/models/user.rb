class User < ApplicationRecord
  has_many :todo
  has_secure_password

  def to_pleasant_string
    "#{id} #{first_name} #{email}"
  end
end
