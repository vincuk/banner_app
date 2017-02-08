require 'spec_helper'

describe Conversion do
  before do
    @conversion = Conversion.new(conversion_id: 100001, click_id: 1001, revenue: 0.123)
  end

  subject { @conversion }

  it { should respond_to(:conversion_id) }
  it { should respond_to(:click_id) }
  it { should respond_to(:revenue) }

  it { should be_valid }

  describe "when conversion_id is not present" do
    before { @conversion.conversion_id = " " }
    it { should_not be_valid }
  end
  
  describe "when click_id is not present" do
    before { @conversion.click_id = " " }
    it { should_not be_valid }
  end
  
  
  describe "when revenue is not present" do
    before { @conversion.revenue = " " }
    it { should_not be_valid }
  end
  
  describe "when conversion_id is already taken" do
    before do
      conversion_with_same_id = @conversion.dup
      conversion_with_same_id.save
    end

    it { should_not be_valid }
  end
end
