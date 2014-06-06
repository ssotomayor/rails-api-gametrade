class ApiKey < ActiveRecord::Base

  validates :access_token, uniqueness: true

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
