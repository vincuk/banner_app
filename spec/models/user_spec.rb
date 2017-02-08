require 'spec_helper'

describe User do
  before do
    @user = User.new(token: "pr0la2lGCjwkzyq41iLlrA")
  end

  subject { @user }
  
  it { should respond_to(:token) }
  
  describe "has token" do
    before { @user.save }
    its(:token) { should_not be_blank }
  end
end
