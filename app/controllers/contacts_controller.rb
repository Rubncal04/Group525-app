class ContactsController < ApplicationController
  def index
    @contacts_by_city = Contact.joins(:city).select("contacts.*, cities.name as city_name").group_by(&:city_name)
  end
end
