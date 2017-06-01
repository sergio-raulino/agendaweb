class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result.order(:name).page(params[:page]).per(10)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    authorize @contact
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    authorize @contact
  end

  # GET /contacts/1/edit
  def edit
    authorize @contact
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params.merge({ user_id: current_user.id}))
    authorize @contact

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      authorize @contact
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    authorize @contact
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(
        :avatar,
        :name,
        :email,
        :cellphone,
        :address,
        :birthdate)
    end
end
