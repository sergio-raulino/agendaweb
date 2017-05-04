require 'rails_helper'

RSpec.describe User, type: :model do
 it "should have a factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context "Should Respond" do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:role_id) }
  end

  context "Enums" do
    describe "role_id" do
      it "should correspond to those values" do
        expect(User.role_ids).to eq({
          "admin" => 1,
          "user"  => 2,
          "dumb"  => 3
        })
      end
    end
  end
end
