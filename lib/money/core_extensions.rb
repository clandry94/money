# Allows Writing of 100.to_money for +Numeric+ types
#   100.to_money => #<Money @cents=10000>
#   100.37.to_money => #<Money @cents=10037>
class Numeric
  def to_money(currency = Money.default_currency)
    Money.new(self, currency)
  end
end

# Allows Writing of '100'.to_money for +String+ types
# Excess characters will be discarded
#   '100'.to_money => #<Money @cents=10000>
#   '100.37'.to_money => #<Money @cents=10037>
class String
  def to_money(currency = Money.default_currency)
    empty? ? Money.empty : Money.parse(self, currency)
  end

  def to_currency
    empty? ? nil : Money::Currency.new(self)
  end
end
