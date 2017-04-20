require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "should have a factory" do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  context "Should raise an error without name" do
    it "with name" do
      contact = FactoryGirl.build(:contact)
      contact.name = nil
      expect(contact.valid?).to be_falsey
    end

    it "return a message: 'não pode ficar em branco'" do
      contact = FactoryGirl.build(:contact)
      contact.name = nil
      contact.save
      expect(contact.errors.messages[:name]).to include("não pode ficar em branco")
    end
  end
  
  context "Should Respond" do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:cellphone) }
    it { should respond_to(:address) }
    it { should respond_to(:birthdate) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:cellphone) }
    it { should validate_presence_of(:birthdate) }
  end
end
