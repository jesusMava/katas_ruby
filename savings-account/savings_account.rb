module SavingsAccount
  def self.interest_rate(balance)
    # NegativeInfinity = -1.0/0.0
    case balance
    when ((-1.0 / 0.0)...0)
      -3.213
    when (0...1000)
      0.5
    when (1000...5000)
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    return balance - (balance * interest_rate(balance) / 100) if interest_rate(balance).negative?

    (balance * interest_rate(balance) / 100) + balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance <= desired_balance
      years += 1
      annual_balance_sum = (current_balance * interest_rate(current_balance) / 100)
      current_balance += annual_balance_sum
    end

    years
  end
end
