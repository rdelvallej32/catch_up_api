#
class ProfilesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /profiles
  # GET /profiles.json
  # def index
  #   @profiles = Profile.all
  #
  #   render json: @profiles
  # end

  def notify
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'],
                                       ENV['TWILIO_AUTH_TOKEN']

    message = @client.messages.create(
      from: @twilio_number,
      to: '',
      body: 'Learning to send SMS you are.',
      media_url: 'http://linode.rabasa.com/yoda.gif'
          )
    render plain: message.status
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    render json: @profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.profiles.build(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    # @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy

    head :no_content
  end

  private

  def set_profile
    @profile = current_user.profiles.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:username, :phone_number)
  end
end
