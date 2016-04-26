# Contacts Controller
class ContactsController < ProtectedController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = current_user.contacts.all

    render json: @contacts
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = current_user.contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH /contacts/:id
  def update
    @contact = current_user.contact.find(params[:id])

    if @contact.update(contact_params)
      head :no_content
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/:id
  def destroy
    @contact.destroy

    head :no_content
  end

  private

  def set_contact
    @contact = current_user.contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :occupation,
                                    :professional_relationship, :company,
                                    :last_contacted, :fact)
  end

  private :set_contact, :contact_params
end
