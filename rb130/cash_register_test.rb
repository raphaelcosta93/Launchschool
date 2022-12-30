require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(50)    
  end

  def test_accept_money
    @transaction.amount_paid = 60
    assert_equal(160, @register.accept_money(@transaction))
  end

  def test_change
    @transaction.amount_paid = 60
    @register.change(@transaction)
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    output = "You've paid $#{@transaction.item_cost}.\n"
    assert_output(output){@register.give_receipt(@transaction)}
  end



end