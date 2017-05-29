# agendaweb/spec/helpers/application_helper_spec.rb

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe ".handle_field" do
    it "should return a field itself if exists" do
      contact = FactoryGirl.create(:contact)
      expect(helper.handle_field(contact.name)).to eq(contact.name)
    end

    it "should return 'n/d' if a blank or nil element" do
      expect(helper.handle_field('')).to eq('n/d')
      expect(helper.handle_field(nil)).to eq('n/d')
    end
  end
end
