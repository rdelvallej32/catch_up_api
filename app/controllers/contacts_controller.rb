# Contacts Controller
class ContactsController < ProtectedController
  before_action :set_contact, only: [:index, :show, :update, :destroy]

  # POST /contacts
  def create
    @contact = current_user.contacts.build(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

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

  # PATCH /contacts/:id
  def update
    # @contact = current_user.contacts.find(params[:id])

    if @contact.update(contact_params)
      render json: @contact, status: :ok
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
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :occupation,
                                    :professional_relationship, :company,
                                    :last_contacted, :fact)
  end

  private :set_contact, :contact_params, :current_user
end
