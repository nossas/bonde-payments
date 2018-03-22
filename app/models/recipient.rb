class Recipient < ActiveRecord::Base
  validates :pagarme_recipient_id, presence: true
  validates :recipient, presence: true
  validates :community, presence: true

  belongs_to :community
  has_many :balance_operations

  def gateway_recipient
    @gateway_recipient ||= PagarMe::Recipient.find pagarme_recipient_id
  end
end
