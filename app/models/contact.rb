class Contact < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :country

  enum gender: { Male: "M", Female: "F" }

  before_validation :is_older_than_eighteen
  before_validation :three_contacts_by_city

  validates :email, presence: true, uniqueness: true
  validates :date_of_birth, :first_name, :last_name, presence: true

  private

  def is_older_than_eighteen
    if date_of_birth.present?
      age = ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
      if age < 18
        errors.add(:date_of_birth, "You must be older than 18 years old")
        throw :abort
      end
    else
      errors.add(:date_of_birth, "Date of birth is required")
      throw :abort
    end
  end

  def three_contacts_by_city
    city_count = Contact.where(city_id: city_id).count
    if city_count >= 3
      errors.add(:city_id, "There could not be more than 3 contacts by city")
      throw :abort
    end
  end
end
