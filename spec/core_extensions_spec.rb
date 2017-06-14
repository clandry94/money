require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

shared_examples_for "an object supporting to_money" do
  it "supports to_money" do
    expect(@value.to_money).to eq(@money)
  end
end

describe Integer do
  before(:each) do
    @value = 1
    @money = Money.new("1.00")
  end

  it_should_behave_like "an object supporting to_money"
end

describe Float do
  before(:each) do
    @value = 1.23
    @money = Money.new("1.23")
  end

  it_should_behave_like "an object supporting to_money"
end

describe String do
  before(:each) do
    @value = "1.23"
    @money = Money.new(@value)
    @currency = Money::Currency.new(:usd)
  end

  it_should_behave_like "an object supporting to_money"

  describe('.to_currency') do
    it 'suppors uppercase currency' do
      expect('USD'.to_currency).to eq(@currency)
    end

    it 'suppors lowercase currency' do
      expect('usd'.to_currency).to eq(@currency)
    end
  end
end

describe BigDecimal do
  before(:each) do
    @value = BigDecimal.new("1.23")
    @money = Money.new("1.23")
  end

  it_should_behave_like "an object supporting to_money"
end
