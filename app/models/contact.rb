class Contact < ApplicationRecord
  belongs_to :city
  
  before_validation :is_older_than_eighteen
  before_validation :three_contacts_by_city

  validates :email, presence: true, uniqueness: true

  private

  def is_older_than_eighteen
    if birthday.present?
      age = ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
      if age < 18
        errors.add(:birthday, "You must be older than 18 years old")
        throw :abort
      end
    else
      errors.add(:birthday, "Birthday is required")
      throw :abort
    end
  end

  def three_contacts_by_city
    city_count = Contact.where(city_id: city_id).count
    if city_count >= 3
      errors.add(:birthday, "There could not be more than 3 contacts by city")
      throw :abort
    end
  end
end
