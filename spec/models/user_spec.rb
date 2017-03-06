require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#to_s" do
    it "returns nil if there is no user" do
      user = User.new
      expect(user.to_s).to eq nil
    end

    it "returns user email" do
      email = "huy@gmail.com"
      user = User.new email: email
      user.save!(validate: false)

      expect(user.to_s).to eq "huy@gmail.com"
    end
  end
end
