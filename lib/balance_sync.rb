require_relative '../app/models/balance_operation'

class BalanceSync
  def initialize(recipient)
    @recipient = recipient
  end

  def sync_balance_operations page = 1, status
    operations = gateway_recipient.balance_operations(
      count: ENV['AMOUNT'].to_i,
      page: page,
      status: status
    )

    if operations.size > 1
      operations.each do |op|
        puts "[BALANCE_OPERATIONS_SYNC] #{op.id} for recipient #{@recipient.id} on page #{page}"
        create_or_find_operation(op)
      end

      sync_balance_operations page+1
    end
  end

  private

  def gateway_recipient
    @recipient.gateway_recipient
  end

  def create_or_find_operation operation
    balance_op = @recipient.balance_operations.find_by_gateway_id(operation.id)

    if balance_op
      balance_op.update_column(:gateway_data, operation.to_hash)
    else
      @recipient.balance_operations.create!(
        gateway_id: operation.id,
        gateway_data: operation.to_hash,
        created_at: operation.date_created
      )
    end
  end
end
