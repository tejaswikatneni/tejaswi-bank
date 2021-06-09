class User < ApplicationRecord
  has_many :accounts

  before_create :generate_identification_number

  private

  def generate_identification_number
    self.identification_number = SecureRandom.uuid
    generate_identification_number if self.class.where(identification_number: identification_number).exists?
  end
end
