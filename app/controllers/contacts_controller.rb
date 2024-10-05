class ContactsController < ApplicationController
  # before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts_by_city = Contact.joins(:city).select("contacts.*, cities.name as city_name").group_by(&:city_name)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
  end
  
  private
  def set_contact
    @image = Contact.find params[:id]
  end

  def contact_params
    params.require(:contact).permit :name, :last_name, :email,
    :city_id, :address, :birthday, :gender
  end
end
