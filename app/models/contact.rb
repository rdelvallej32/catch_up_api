# Contact that belongs to User
class Contact < ActiveRecord::Base
  belongs_to :user, inverse_of: :contacts, class_name: 'User'
  validates_presence_of :first_name, :last_name, :occupation,
                        :professional_relationship, :company,
                        :last_contacted, :fact, :reminder
  # validates :first_name, :user, presence: true
  # validates :user, uniqueness: true

  # after_create :notify
  # after_update :notify
  # 
  # def notify
  #   @twilio_number = ENV['TWILIO_NUMBER']
  #   @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'],
  #                                      ENV['TWILIO_AUTH_TOKEN']
  #
  #   @alert_message = 'Login to your CatchUp account and view the contacts you have not spoken to in a month!'
  #
  #   @holder = User.joins(:contacts).group('users.id').where('contacts.last_contacted < ? AND reminder= ?', 1.months.ago, 1)
  #
  #   # Checks to see if there is a phone number
  #   @phone_holder = @holder.map { |entry| entry.phone_number unless entry.phone_number.nil? }
  #
  #   # Stores the numbers in an array
  #   @phone_array = @phone_holder.find_all { |entry| entry.is_a?(String) }
  #
  #   @phone_array.each do |phone_number|
  #     @client.messages.create(
  #       from: @twilio_number,
  #       to: phone_number,
  #       body: @alert_message
  #       # media_url: 'http://ww2.kqed.org/pop/wp-content/uploads/sites/12/2016/04/anigif_enhanced-buzz-25616-1375835253-17.gif'
  #     )
  #     puts 'Sent message!'
  #   end
  # end
end
