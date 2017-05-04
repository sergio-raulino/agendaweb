require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe ".handle_field" do
     it "should return a field irself if exist" do
       contact = FactoryGirl.create(:contact)
       expect(helper.handle_field(contact.name)).to eq(contact.name)
     end

     it "should return '<sem dados>' if a blank or nil element" do
        expect(helper.handle_field('')).to eq('<sem dados>')
        expect(helper.handle_field(nil)).to eq('<sem dados>')
     end

  end
end
