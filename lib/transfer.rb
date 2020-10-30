class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount = 50, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
 
  end

  def valid? 
    self.sender.valid? && self.receiver.valid? 
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
    else
      "sdhjfklj"
    end
  end

end
