class ContactsController < ApplicationController
  # before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts_by_city = Contact.joins(:city).select("contacts.*, cities.name as city_name").group_by(&:city_name)
  end

  def new
    @contact = Contact.new
    @countries = Country.all.order(:name)
  end

  def get_states
    @states = State.where(country_id: params[:country_id])
    respond_to do |format|
      format.json { render json: @states }
    end
  end

  def get_cities
    @cities = City.where(state_id: params[:state_id])
    respond_to do |format|
      format.json { render json: @cities }
    end
  end

  def create
    @contact = Contact.new contact_params

    if @contact.save
      redirect_to contacts_url, notice: "Contact successfully created."
    else
      flash.now[:alert] = "There was an error saving the contact."
      render action: :new
    end
  end

  private
  def set_contact
    @image = Contact.find params[:id]
  end

  def contact_params
    params.require(:contact).permit :first_name, :last_name, :email,
    :city_id, :address, :date_of_birth, :gender, :country_id, :state_id
  end
end
