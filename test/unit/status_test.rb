require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Status.new.valid?
  end
end
