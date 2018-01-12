module User::Auth

  extend ActiveSupport::Concern

  # виртуальные атрибуты - не хранятся в БД
  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : self
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    else
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end