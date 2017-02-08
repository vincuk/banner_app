require 'spec_helper'

describe Impression do
  before do
    @impression = Impression.new(banner_id: 111, campaign_id: 2)
  end

  subject { @impression }

  it { should respond_to(:banner_id) }
  it { should respond_to(:campaign_id) }

  it { should be_valid }
end
