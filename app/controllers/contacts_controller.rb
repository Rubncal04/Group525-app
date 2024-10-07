class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :show, :destroy]

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

  def index
    @contacts_by_city = get_index_contacts
  end

  def new
    @contact = Contact.new
    @countries = Country.all.order(:name)
  end

  def create
    @contact = Contact.new contact_params

    if @contact.save
      redirect_to root_path, notice: "Contact successfully created."
    else
      flash.now[:alert] = "There was an error saving the contact."
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @contact.update contact_params
      redirect_to root_path, notice: "Contact successfully updated."
    else
      flash.now[:alert] = "There was an error saving the contact."
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to root_path, notice: "Contact successfully deleted."
  rescue StandardError => e
    redirect_to root_path, alert: "There was an error deleting the contact."
  end

  def download_file
    @contacts = get_index_contacts

    pdf = WickedPdf.new.pdf_from_string(
      render_to_string('download', layout: false))
    send_data(pdf,
      filename: 'contacts-by-city.pdf',
      type: 'application/pdf',
      disposition: 'attachment')
  end

  private
  def set_contact
    @contact = Contact.find params[:id]
  end

  def contact_params
    params.require(:contact).permit :first_name, :last_name, :email,
    :city_id, :address, :date_of_birth, :gender, :country_id, :state_id
  end

  def get_index_contacts
    Contact.joins(:city).select("contacts.*, cities.name as city_name").group_by(&:city_name)
  end
end
